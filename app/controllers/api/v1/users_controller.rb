module Api
  module V1
    class UsersController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_admin, only: [:index]

      def create
        user = User.create(user_params)
        if user.save
          token = AuthenticationTokenService.encode(user)
          render json: {
            loggedIn: true,
            username: user.username,
            email: user.email,
            admin: user.admin,
            token: token
          }, status: :created
        else
          render json: { error: user.errors.full_messages.first }, status: :unprocessable_entity
        end
      end

      def index
        users = User.all
        render json: users
      end

      private

      def user_params
        params.permit(:username, :password, :password_confirmation, :email)
      end

      def authenticate_admin
        token, _options = token_and_options(request)
        return render json: { error: 'No Authorization headers.' }, status: :unauthorized if token.nil?

        message = AuthenticationTokenService.decode(token)
        return render json: message, status: :unauthorized if message[:error]

        user_id = message[:user_id]
        current_user = User.find(user_id)
        render json: { error: 'No admin role.' }, status: :unauthorized unless current_user.admin?
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'No user found.' }, status: :unauthorized
      end
    end
  end
end

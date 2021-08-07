module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :set_and_authenticate_user, only: [:create]

      def create
        token = AuthenticationTokenService.encode(@user)
        render json: {
          loggedIn: true,
          username: @user.username,
          email: @user.email,
          admin: @user.admin,
          token: token
        }
      end

      private

      def set_and_authenticate_user
        @user = User.find_by(username: auth_params[:username]) || User.find_by(email: auth_params[:email])
        return handle_unauthenticated if @user.nil? || !@user.authenticate(auth_params[:password])
      end

      def handle_unauthenticated
        render json: { error: 'Incorrect password, username or e-mail.' }, status: :unauthorized
      end

      def auth_params
        params.require(:authentication).permit(:username, :password, :email, :admin)
      end
    end
  end
end

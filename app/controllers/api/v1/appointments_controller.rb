module Api
  module V1
    class AppointmentsController < ApplicationController
      include ActionController::HttpAuthentication::Token
      before_action :authenticate_admin, only: [:index]
      before_action :authenticate_user, only: %i[create show destroy]

      def create
        appointment = Appointment.create(**appointment_params, user_id: @current_user.id)
        if appointment.save
          render json: { success: 'Apointment created succesfully!' }, status: :created
        else
          render json: { error: appointment.errors[:error].first }, status: :unprocessable_entity
        end
      end

      def show
        appointments = Appointment.current_user_appointments(@current_user)
        render json: appointments.to_json({
                                            only: %i[id start_time],
                                            include: {
                                              lecture: {
                                                only: [:name]
                                              }
                                            }
                                          })
      end

      def destroy
        # byebug
        appointment = @current_user.appointments.find(params[:id])
        appointment.destroy
        render json: { info: 'Appointment deleted succesfully' }
      end

      def index
        appointments = Appointment.all
        render json: appointments
      end

      private

      def appointment_params
        params.require(:appointment).permit(:start_time, :lecture_id)
      end

      def authenticate_user
        token, _options = token_and_options(request)
        return render json: { error: 'You must log in first.' }, status: :unauthorized if token.nil?

        message = AuthenticationTokenService.decode(token)
        return render json: message, status: :unauthorized if message[:error]

        user_id = message[:user_id]
        @current_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'No user found.' }, status: :unauthorized
      end

      def authenticate_admin
        token, _options = token_and_options(request)
        return render json: { error: 'No Authorization headers.' }, status: :unauthorized if token.nil?

        message = AuthenticationTokenService.decode(token)
        return render json: message, status: :unauthorized if message[:error]

        user_id = message[:user_id]
        @current_user = User.find(user_id)
        render json: { error: 'No admin role.' }, status: :unauthorized unless @current_user.admin?
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'No user found.' }, status: :unauthorized
      end
    end
  end
end

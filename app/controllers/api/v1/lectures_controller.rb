module Api
  module V1
    class LecturesController < ApplicationController
      def index
        lectures = Lecture.all
        render json: lectures.to_json({ except: %i[created_at updated_at] })
      end
    end
  end
end

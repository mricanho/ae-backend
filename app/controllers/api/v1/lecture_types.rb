module Api
  module V1
    class LectureTypesController < ApplicationController
      def index
        lecture_types = LectureType.all
        render json: lecture_types.to_json({ except: %i[created_at updated_at] })
      end
    end
  end
end

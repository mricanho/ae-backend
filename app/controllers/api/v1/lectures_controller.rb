module Api
  module V1
    class LecturesController < ApplicationController
      def index
        lectures = Lecture.all_with_associations
        render json: lectures.to_json({
                                        except: %i[created_at updated_at],
                                        include: {
                                          group: {
                                            only: [:id]
                                          }
                                        }
                                      })
      end
    end
  end
end

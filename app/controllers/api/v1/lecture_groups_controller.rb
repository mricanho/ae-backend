class Api::V1::LectureGroupsController < ApplicationController
  def index
    lecture_groups = LectureGroup.all
    render json: lecture_groups.to_json({ except: %i[created_at updated_at] })
  end
end

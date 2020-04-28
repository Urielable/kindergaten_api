class Api::V1::Graphs::BabyActivitiesController < ApplicationController
  def index
    if activity_logs_params_url[:baby_id]
      @items = ActivityLog.series_activiy_logs_baby(activity_logs_params_url[:baby_id])
      render :index
    else
      @error = [{"message": {"baby_is_required": "#{I18n.t 'baby_dont_exist'}"}}, false]
      render :error
    end
  end

  private
    def activity_logs_params_url
      params.permit(:baby_id, :id)
    end
end

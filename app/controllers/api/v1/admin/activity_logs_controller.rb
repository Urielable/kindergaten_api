class Api::V1::Admin::ActivityLogsController < ApplicationController

  def index
    @activity_log, valid = LoadActivityLogAction.execute(filtering_get_params)
    if valid
      render :index, status: :ok
    else
      render :error, status: :bad_request
    end
  end


  private
    def filtering_get_params
      params.permit(
        :assistant_id,
        :baby_id,
        :status
      )
    end
end

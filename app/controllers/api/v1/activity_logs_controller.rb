class Api::V1::ActivityLogsController < ApplicationController

  def index
  end

  def create
    @response, valid = SaveBabyActivityLogAction.execute(activity_logs_params)
    if valid
      render :show, status: 200
    else
      render :error, status: 409
    end
  end

  def update

  end

  def destroy

  end

  private
    def activity_logs_params
      params.require(:activity_log).permit(
        :baby_id,
        :assistant_id,
        :activity_id,
        :start_time,
        :stop_time,
        :comments
      )
    end

end

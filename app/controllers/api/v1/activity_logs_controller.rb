class Api::V1::ActivityLogsController < ApplicationController

  def index
    @activity_log, valid = LoadActivityLogAction.execute(params[:baby_id])
    if valid
      render :index, status: :ok
    else
      render :error, status: :bad_request
    end
  end

  def create
    @activity_log, valid = SaveBabyActivityLogAction.execute(activity_logs_params)
    if valid
      render :show, status: :ok
    else
      render :error, status: :bad_request
    end
  end

  def update
    @activity_log, valid = UpdateBabyActivityLogAction.execute(activity_logs_params, activity_logs_params_url)
    if valid
      render :show, status: :ok
    else
      render :error, status: :bad_request
    end
  end

  private

    def activity_logs_params_url
      params.permit(:baby_id, :id)
    end
    
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

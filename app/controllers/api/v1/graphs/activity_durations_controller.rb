class Api::V1::Graphs::ActivityDurationsController < ApplicationController
  def index
    @items = ActivityLog.all.pluck(:duration).compact
    render :index
  end
end

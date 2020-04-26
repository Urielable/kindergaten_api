class Api::V1::Catalogs::AssistantsController < ApplicationController
  def index
    @assistants = Assistant.all.select(:id, 'name as value')
    render :index
  end
end

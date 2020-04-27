class Api::V1::BabiesController < ApplicationController
  before_action :authenticate_user

  def index
    @babies = Baby.all
  end
end

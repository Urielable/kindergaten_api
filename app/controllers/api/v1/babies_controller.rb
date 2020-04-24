class Api::V1::BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end
end

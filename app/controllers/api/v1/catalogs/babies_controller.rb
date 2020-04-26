class Api::V1::Catalogs::BabiesController < ApplicationController
  def index
    @babies = Baby.all.select('id as id, CONCAT(babies.name, " ", babies.father_name, " ", babies.mother_name) as value')
    render :index
  end
end

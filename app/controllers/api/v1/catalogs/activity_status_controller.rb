class Api::V1::Catalogs::ActivityStatusController < ApplicationController
  def index
    @status = [
        {
          id: 0,
          value: "Todos"
        },
        {
          id: 1,
          value: "En progreso"
        },
        {
          id: 2,
          value: "Terminada"
        }
      ]
    render :index
  end
end

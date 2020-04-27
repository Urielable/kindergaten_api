class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  # GET /api/v1/users.json
  def index
    @api_v1_users = User.all
  end

  # GET /api/v1/users/1
  # GET /api/v1/users/1.json
  def show
  end

  # POST /api/v1/users
  # POST /api/v1/users.json
  def create
    @user = User.new(api_v1_user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  # PATCH/PUT /api/v1/users/1.json
  def update
    if @api_v1_user.update(api_v1_user_params)
      render :show, status: :ok, location: @api_v1_user
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  # DELETE /api/v1/users/1.json
  def destroy
    @api_v1_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @api_v1_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end
end

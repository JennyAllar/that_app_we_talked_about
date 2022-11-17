class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.create!(name: params[:user][:name], phone_number: params[:user][:phone_number])
    render json: user
  end
end

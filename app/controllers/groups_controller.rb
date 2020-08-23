class GroupsController < ApplicationController
  include Authorization
  before_action :authorized

  def create
    group = Group.new(group_params)
    group.admin = @current_user
    if group.save
      render json: group
    else
      render json: { error: group.errors.full_messages }, status: :bad_request
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :password, :public)
  end
end

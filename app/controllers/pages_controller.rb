class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    @role = Role.where(user: current_user)
    @stages = Stage.where(role: @role)
  end

  def total_interviews

  end
end

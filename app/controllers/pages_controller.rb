class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    @roles = Role.where(user: current_user)
    @stages = Stage.where(role: @role)
    # @total = total_interviews(role)
  end

  # def total_interviews(role)
  #   role.interviews.count
  # end
end

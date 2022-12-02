class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    @roles = Role.where(user: current_user)
  end
end

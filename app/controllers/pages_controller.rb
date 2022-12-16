class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @roles = Role.where(user: current_user)
  end
end

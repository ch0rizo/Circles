class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @events = Event.all
    @circles = Circle.all
  end
end

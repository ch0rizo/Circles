class UsersController < ApplicationController
  def profile
    @events = Event.all
  end
end

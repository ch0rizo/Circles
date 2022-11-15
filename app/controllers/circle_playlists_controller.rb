class CirclePlaylistsController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @circle_playlist = CirclePlaylist.new(circle_playlist_params)
    @circle_playlist.circle = @circle
    if @circle_playlist.save
      redirect_to @circle
    else
      render "circles/show", status: :unprocessable_entity
    end
  end

  private

  def circle_playlist_params
    params.require(:circle_playlist).permit(:url)
  end
end

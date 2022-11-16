class EventPlaylistsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_playlist = EventPlaylist.new(event_playlist_params)
    @event_playlist.event = @event
    if @event_playlist.save
      redirect_to @event
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def event_playlist_params
    params.require(:event_playlist).permit(:url)
  end
end

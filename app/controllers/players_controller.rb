class PlayersController < ApplicationController
  def index
    @players = Player.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @player = Player.find_by id: params[:id]
    unless @player
      flash[:warning] = t "player.not_found"
      redirect_to root_path
    end
  end
end

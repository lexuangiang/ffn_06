class ClubsController < ApplicationController
  before_action :check_correct_club, only: :show

  def index
    @clubs = Club.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @players = @club.players.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  private
  def check_correct_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:warning] = I18n.t "club.club_not_found"
      redirect_to root_path
    end
  end
end

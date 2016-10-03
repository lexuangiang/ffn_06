class ClubsController < ApplicationController
  before_action :find_club, only: [:edit, :show]

  def index
    @clubs = Club.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new club_params
    if @club.save
      redirect_to @club
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @club.update_attributes club_params
      redirect_to @club
    else
      render :edit
    end
  end

  private
  def club_params
    params.require(:club).permit :club_name, :location, :stadium,
      :coach, :founding,:image
  end

  def find_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:warning] = I18n.t "club.club_not_found"
      redirect_to root_path
    end
  end
end

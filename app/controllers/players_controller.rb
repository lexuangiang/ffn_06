class PlayersController < ApplicationController
  before_action :check_correct_player, only: [:edit, :show, :update]

  def index
    @players = Player.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @player = Player.new
    @clubs = Club.all
  end

  def create
    @player = Player.new player_params
    if @player.save
      flash[:warning] = I18n.t "player.create_success"
      redirect_to @player
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update_attributes player_params
      flash[:warning] = I18n.t "player.edit_success"
      redirect_to @player
    else
      render :edit
    end
  end

  private
  def player_params
    params.require(:player).permit :player_name, :nationality, :position,
      :weight, :height, :image, :club_id
  end

  def check_correct_player
    @player = Player.find_by id: params[:id]
    unless @player
      flash[:warning] = I18n.t "player.not_found"
      redirect_to root_path
    end
  end
end

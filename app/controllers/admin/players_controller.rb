class Admin::PlayersController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :find_player, except: [:create, :new, :index]
  before_action :prepare_form_data, except: [:index, :show]

  def index
    @players = Player.asc_by_name.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new player_params
    if @player.save
      flash[:success] = t "player.create_success"
      redirect_to @player
    else
      @errors_count = @player.errors.size
      flash[:warning] = t "player.create_fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update_attributes player_params
      flash[:success] = t "player.edit_success"
      redirect_to @player
    else
      @errors_count = @player.errors.size
      flash[:success] = t "player.edit_fail"
      render :edit
    end
  end

  def destroy
    if @player.destroy
      flash[:success] = t "player.deleted"
      redirect_to admin_players_path
    else
      flash[:warning] = t "player.destroy_fail"
      redirect_to root_path
    end
  end

  private
  def player_params
    params.require(:player).permit :player_name, :nationality, :position,
      :weight, :height, :image, :club_id
  end

  def find_player
    @player = Player.find_by id: params[:id]
    unless @player
      flash[:warning] = t "player.not_found"
      redirect_to root_path
    end
  end

  def prepare_form_data
    @clubs = Club.all
  end
end

class Admin::MatchesController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_match, except: [:index, :new, :create]
  before_action :load_clubs, :load_rates, except: [:index, :show]

  def index
    @matches = Match.desc_by_match_date.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new match_params
    if @match.save
      flash.now[:success] = t "match.create_success"
      redirect_to admin_matches_path
    else
      flash.now[:warning] = t "match.create_fail"
      errors_count
      render :new
    end
  end

  def edit
  end

  def update
    if @match.update_attributes match_params
      flash.now[:success] = t "match.update_success"
      redirect_to admin_matches_path
    else
      flash.now[:warning] = t "match.update_fail"
      errors_count
      render :edit
    end
  end

  def destroy
    if @match.destroy
      flash.now[:success] = t "match.deleted"
      redirect_to admin_matches_path
    else
      flash.now[:warning] = t "match.delete_fail"
      redirect_to admin_path
    end
  end

  private
  def match_params
    params.require(:match).permit :match_date, :match_time, :home_id, :away_id,
      :rate_id, :club_id, :home_goal, :away_goal, :match_status
  end

  def errors_count
    @errors_count = @match.errors.size
  end

  def load_match
    @match = Match.find_by id: params[:id]
    unless @match
      flash.now[:warning] = t "match.not_found"
      redirect_to root_path
    end
  end

  def load_clubs
    @clubs = Club.all
  end

  def load_rates
    @rates = Rate.all
  end
end

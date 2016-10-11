class Admin::ScoresController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :find_score, except: [:create, :new, :index]

  def index
    @scores = Score.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new score_params
    if @score.save
      flash[:success] = t "score.create_success"
      redirect_to @score
    else
      @errors_count = @score.errors.size
      render :new
    end
  end

  def edit
  end

  def update
    if @score.update_attributes score_params
      flash[:success] = t "score.edit_success"
      redirect_to @score
    else
      @errors_count = @score.errors.size
      render :edit
    end
  end

  def destroy
    if @score.destroy
      flash[:success] = t "score.deleted"
      redirect_to admin_scores_path
    else
      flash[:warning] = t "score.destroy_fail"
      redirect_to root_path
    end
  end

  private
  def score_params
    params.require(:score).permit :home_score, :away_score
  end

  def find_score
    @score = Score.find_by id: params[:id]
    unless @score
      flash[:warning] = t "score.not_found"
      redirect_to root_path
    end
  end
end

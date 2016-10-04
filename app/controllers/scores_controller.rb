class ScoresController < ApplicationController
  before_action :check_correct_score, only: [:edit, :show, :update]

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
      @errors = @score.errors.size
      render :new
    end
  end

  def edit
  end

  def update
    if @score.update_attributes score_params
      flash[:warning] = t "score.edit_success"
      redirect_to @score
    else
      render :edit
    end
  end

  private
  def score_params
    params.require(:score).permit :home_score, :away_score
  end

  def check_correct_score
    @score = Score.find_by id: params[:id]
    unless @score
      flash[:warning] = t "score.not_found"
      redirect_to root_path
    end
  end
end

class ScoresController < ApplicationController

  def index
    @scores = Score.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @score = Score.find_by id: params[:id]
    unless @score
      flash[:warning] = t "score.not_found"
      redirect_to root_path
    end
  end
end

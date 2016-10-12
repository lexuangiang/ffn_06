class MatchesController < ApplicationController
  before_action :load_match, only: :show

  def index
  @matches = Match.desc_by_match_date.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  private
  def load_match
    @match = Match.find_by id: params[:id]
    unless @match
      flash.now[:warning] = t "match.not_found"
      redirect_to root_path
    end
  end
end

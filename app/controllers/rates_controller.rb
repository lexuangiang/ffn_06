class RatesController < ApplicationController
  before_action :load_rate, only: [:show]

  def index
    @rates = Rate.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
  end

  private
  def load_rate
    @rate = Rate.find_by id: params[:id]
    unless @rate
      flash[:warning] = t "rate.not_found"
      redirect_to root_path
    end
  end
end

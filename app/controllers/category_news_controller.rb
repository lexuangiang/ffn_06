class CategoryNewsController < ApplicationController
  before_action :load_category_news, only: :show

  def index
    @category_news = CategoryNews.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  private
  def load_category_news
    @category_news = CategoryNews.find_by id: params[:id]
    unless @category_news
      flash[:warning] = t "category_news.not_found"
      redirect_to root_path
    end
  end
end

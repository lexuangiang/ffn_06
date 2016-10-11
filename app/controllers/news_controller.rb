class NewsController < ApplicationController
  before_action :load_news, only: :show

  def index
    @news = News.asc_by_created_at.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  private
  def load_news
    @news = News.find_by id: params[:id]
    unless @news
      flash[:warning] = t "news.not_found"
      redirect_to root_path
    end
  end
end

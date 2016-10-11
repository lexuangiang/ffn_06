class Admin::NewsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_news, except: [:index, :new, :create]
  before_action :load_category_news, except: [:index, :show]

  def index
    @news = News.asc_by_created_at.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    if @news.save
      flash[:success] = t "news.create_success"
      redirect_to @news
    else
      error_count
      flash[:warning] = t "news.create_fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update_attributes news_params
      flash[:success] = t "news.update_success"
      redirect_to @news
    else
      error_count
      flash[:warning] = t "news.update_fail"
      render :edit
    end
  end

  def destroy
    if @news.destroy
      flash[:success] = t "news.deleted"
      redirect_to admin_news_index_path
    else
      flash[:warning] = t "news.delete_fail"
      redirect_to root_path
    end
  end

  private
  def news_params
    params.require(:news).permit :title, :body, :category_news_id, :user_id, :image
  end

  def load_news
    @news = News.find_by id: params[:id]
    unless @news
      flash[:warning] = t "news.not_found"
      redirect_to root_path
    end
  end

  def load_category_news
    @category_news = CategoryNews.all
  end

  def error_count
    @errors_count = @news.errors.size
  end
end

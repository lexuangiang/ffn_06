class Admin::CategoryNewsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_category_news, except: [:index, :new, :create]

  def index
    @category_news = CategoryNews.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end

  def new
    @category_news = CategoryNews.new
  end

  def create
    @category_news = CategoryNews.new category_params
    if @category_news.save
      flash[:success] = t "category_news.create_success"
      redirect_to @category_news
    else
      flash[:warning] = t "category_news.create_fail"
      error_count
      render :new
    end
  end

  def edit
  end

  def update
    if @category_news.update_attributes category_params
      flash[:success] = t "category_news.update_success"
      redirect_to @category_news
    else
      flash[:warning] = t "category_news.update_fail"
      error_count
      render :edit
    end
  end

  def destroy
    if @category_news.destroy
      flash[:success] = t "category_news.deleted"
      redirect_to admin_category_news_index_path
    else
      flash[:warning] = t "category_news.delete_fail"
      redirect_to root_path
    end
  end

  private
  def category_params
    params.require(:category_news).permit :category_name
  end

  def load_category_news
    @category_news = CategoryNews.find_by id: params[:id]
    unless @category_news
      flash[:warning] = t "category_news.not_found"
      redirect_to root_path
    end
  end

  def error_count
    @errors_count = @category_news.errors.size
  end
end

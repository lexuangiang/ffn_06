class Admin::RatesController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_rate, except: [:index, :new, :create]
  before_action :prepare_form_data, except: [:index, :show]

  def index
    @rates = Rate.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new rate_params
    if @rate.save
      flash[:success] = t "rate.create_success"
      redirect_to @rate
    else
      flash[:warning] = t "rate.create_fail"
      errors_count
      render :new
    end
  end

  def edit
  end

  def update
    if @rate.update_attributes rate_params
      flash[:success] = t "rate.update_success"
      redirect_to @rate
    else
      flash[:warning] = t "rate.update_fail"
      errors_count
      render :edit
    end
  end

  def destroy
    if @rate.destroy
      flash[:success] = t "rate.deleted"
      redirect_to admin_rates_path
    else
      flash[:warning] = t "rate.delete_fail"
      redirect_to root_path
    end
  end

  private
  def rate_params
    params.require(:rate).permit :home_rate, :away_rate, :category_match_rate_id,
      :rate_name
  end

  def load_rate
    @rate = Rate.find_by id: params[:id]
    unless @rate
      flash[:warning] = t "rate.not_found"
      redirect_to root_path
    end
  end

  def errors_count
    @errors_count = @rate.errors.size
  end

  def prepare_form_data
    @category_match_rates = CategoryMatchRate.all
  end
end

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_q

  add_flash_types :success, :info, :warning, :danger

  def set_search
    @results = @q.result
    @results_page = @results.page params[:page]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def set_q
    @q = Bathhouse.ransack(params[:q])
  end

  def set_bathhouse
    @bathhouse = Bathhouse.find(params[:id])
  end

end
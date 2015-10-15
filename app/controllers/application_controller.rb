class ApplicationController < ActionController::API
  respond_to :json, :html
  include ActionView::Helpers::DateHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  # before_action :authenticate_user!



  before_action :allow_cross_origin_requests, if: proc { Rails.env.development? }

  def preflight
    render nothing: true
  end

  private
  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end


  protected

  # If you have extra params to permit, append them to the sanitizer.


end

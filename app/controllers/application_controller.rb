class ApplicationController < ActionController::API
  respond_to :json, :html
  include ActionView::Helpers::DateHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  # before_action :authenticate_user!



  before_action :allow_cross_origin_requests   #, if: proc { Rails.env.development? }

  def preflight
    render nothing: true
  end

  private

  def allow_cross_origin_requests
    p request.headers['HTTP_ORIGIN']
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
    # if /\Ahttps?:\/\/localhost:8080\z/ =~ request.headers['HTTP_ORIGIN']
    #   p "************************"
    #   p headers['Access-Control-Allow-Origin']
    #   p "I'M HIT!"
    #   headers['Access-Control-Allow-Origin'] = request.headers['HTTP_ORIGIN']
    #   p headers['Access-Control-Allow-Origin']
    # end
  end


  protected

  # If you have extra params to permit, append them to the sanitizer.


end

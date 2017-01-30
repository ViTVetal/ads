class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
  	@resource_class ||= Devise
  end

  helper_method :resource, :resource_name, :devise_mapping, :resource_class
end

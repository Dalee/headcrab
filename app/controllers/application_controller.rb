class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def serialize(resource)
    ActiveModelSerializers::SerializableResource.new(resource, key_transform: :camel_lower)
  end
end

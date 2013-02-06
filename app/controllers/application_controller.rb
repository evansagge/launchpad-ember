class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    scope == :user ? admin_root_path : super
  end

  def after_sign_out_path_for(resource)
    admin_root_path
  end

  def render_errors(record)
    render_to_string(partial: "error_messages", layout: false, locals: { record: record }).html_safe
  end  
end

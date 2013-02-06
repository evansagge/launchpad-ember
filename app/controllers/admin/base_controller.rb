class Admin::BaseController < ApplicationController

  before_filter :authenticate_user!

  layout 'admin'

  protected

  def self.navigation(enabled)
    before_filter do |c|
      c.navigation_disabled = !enabled
    end
  end

  def navigation_disabled=(value)
    @navigation_disabled = value
  end

  def navigation_disabled
    @navigation_disabled
  end
  helper_method :navigation_disabled

end
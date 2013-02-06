module NavigationHelper

  def active_link_to(name, url, options = {})
    li_options = {}
    li_options[:class] = "active" if is_active_link?(url, options.delete(:condition) || :exclusive)

    content_tag :li, link_to(name.html_safe, url, options), li_options
  end

  def is_active_link?(url, condition = nil)
    url = url_for(url).sub(/\?.*/, '') # ignore GET params
    case condition
    when :inclusive, nil
      !request.fullpath.match(/^#{Regexp.escape(url)}(\/.*|\?.*)?$/).blank?
    when :exclusive
      !request.fullpath.match(/^#{Regexp.escape(url)}\/?(\?.*)?$/).blank?
    when Regexp
      !request.fullpath.match(condition).blank?
    when Array
      controllers = [*condition[0]]
      actions = [*condition[1]]
      (controllers.blank? || controllers.member?(params[:controller])) &&
      (actions.blank? || actions.member?(params[:action]))
    when TrueClass
      true
    when FalseClass
      false
    end
  end

  def icon(*names)
    content_tag(:icon, nil, class: names.map{|name| "icon-#{name} "})
  end

end
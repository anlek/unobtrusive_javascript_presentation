# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  
  def spinner(id="spinner", css_class = "")
  	image_tag("spinner.gif", :id => id, :style=>"display:none", :class => "spinner #{css_class}")
  end
end

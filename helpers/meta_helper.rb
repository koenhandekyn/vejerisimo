def host_with_port
  [config[:host], optional_port].compact.join(':')
end

def optional_port
  config[:port] unless config[:port].to_i == 80
end

def image_url(source)
  config[:protocol] + host_with_port + image_path(source)
end

def page_title
  title = config[:site_title]
  # if current_article && current_article.title
  #   title = site_title + " | " +  current_article.title
  # end
  title
end

# def page_description
#   description = config[:site_description]

#   # if current_article && current_article.summary(100)
#   #   description = current_article.summary(100)
#   # end

#   description
# end

# def page_keywords
#   keywords = [] # Set site keywords here

#   # if current_article && current_article.tags
#   #   keywords.concat(current_article.data.tags)
#   # end

#   keywords.uniq.join(", ")
# end

###
# Blog settings
###

# Time.zone = "UTC"

# activate :blog do |blog|
#   # This will add a prefix to all links, template references and source paths
#   # blog.prefix = "blog"

#   # blog.permalink = "{year}/{month}/{day}/{title}.html"
#   # Matcher for blog source files
#   blog.sources = "posts/{year}-{month}-{day}-{title}.html"
#   # blog.taglink = "tags/{tag}.html"
#   # blog.layout = "layout"
#   # blog.summary_separator = /(READMORE)/
#   # blog.summary_length = 250
#   # blog.year_link = "{year}.html"
#   # blog.month_link = "{year}/{month}.html"
#   # blog.day_link = "{year}/{month}/{day}.html"
#   blog.default_extension = ".md"

#   blog.tag_template = "tag.html"
#   blog.calendar_template = "calendar.html"

#   # Enable pagination
#   blog.paginate = true
#   blog.per_page = 10
#   # blog.page_link = "page/{num}"
# end

# page "/feed.xml", layout: false
# page "/sitemap.xml", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

# Change Compass configuration
# config :development do
compass_config do |config|
  config.sass_options = {:debug_info => true}
end
# end


###
# Page options, layouts, aliases and proxies
###
# Slim::Engine.set_default_options lang: I18n.locale, locals: {}

# Slim settings
Slim::Engine.set_default_options :pretty => true
# shortcut
Slim::Engine.set_default_options :shortcut => {
  '#' => {:tag => 'div', :attr => 'id'},
  '.' => {:tag => 'div', :attr => 'class'},
  '&' => {:tag => 'input', :attr => 'type'}
}

# Markdown settings
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true
set :markdown_engine, :redcarpet

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
# page "/localizable/mobile/*", :layout => :mobile # not working, path wrong ?
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes
activate :i18n, :langs => [:en, :es, :fr, :nl] # , :mount_at_root => false

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :middleman_simple_thumbnailer

activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  options.manifest = true


  # Silence problematic image_optim workers
  options.skip_missing_workers = true

  # Cause image_optim to be in shouty-mode
  options.verbose = false

  # Setting these to true or nil will let options determine them (recommended)
  options.nice = true
  options.threads = true

  # Image extensions to attempt to compress
  options.image_extensions = %w(.png .jpg .gif .svg)

  # Compressor worker options, individual optimisers can be disabled by passing
  # false instead of a hash
  options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
  options.pngout    = { :copy_chunks => false, :strategy => 0 }
  options.pngout    = false
  options.svgo      = {}
  options.svgo      = false
  options.advpng    = { :level => 4 }
  options.gifsicle  = { :interlace => false }
  options.jpegoptim = { :allow_lossy => true, :strip => ['all'], :max_quality => 80 }
  options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
  options.optipng   = { :level => 6, :interlace => false }
end

###
# Site Settings
###
# Set site setting, used in helpers / sitemap.xml / feed.xml.
set :site_url, 'http://www.vejerísimo.com'
set :site_author, 'Wim & Marie'
set :site_title, 'VEJERÍSIMO'
set :site_description, 'Vejerísimo'
set :site_keywords, 'Vejer, Andalusia, Spain, Hotel, Bed & Breakfast, Casa, Tiene, Patio, Planta'
# Select the theme from bootswatch.com.
# If false, you can get plain bootstrap style.
# set :theme_name, 'flatly'
set :theme_name, false
# set @analytics_account, like "XX-12345678-9"
@analytics_account = "UA-63217615-1"

# Asset Settings
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  Dir.glob(File.join("#{root}", @bower_config["directory"], "*", "fonts")) do |f|
    sprockets.append_path f
  end
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end


###
# Target settings
###

# To build the target of "android" you would run:
# MIDDLEMAN_BUILD_TARGET=android middleman build

# require 'middleman-target'
# activate :target do |target|

#  target.build_targets = {
#    "phonegap" => {
#      :includes => %w[android ios]
#    }
#  }

# end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # Minify Javascript on build
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :gzip
  # Enable cache buster
  # activate :asset_hash
  # Use relative URLs
  activate :relative_assets
  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

###
# Deploy settings
###

# ftp deployment configuration.
# activate :deploy do |deploy|
#   deploy.method = :ftp
#   deploy.host = "ftp-host"
#   deploy.user = "ftp-user"
#   deploy.password = "ftp-password"
#   deploy.path = "ftp-path"
# end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = 'master'
  # deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

set :protocol, "http://"
set :host, "www.vejerisimo.com/"
set :port, 80

helpers do
  def host_with_port
    [host, optional_port].compact.join(':')
  end

  def optional_port
    port unless port.to_i == 80
  end

  def image_url(source)
    protocol + host_with_port + image_path(source)
  end
end

configure :development do
  # Used for generating absolute URLs
  set :host, Middleman::PreviewServer.host
  set :port, Middleman::PreviewServer.port
end

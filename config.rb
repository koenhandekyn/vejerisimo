###
# Page options, layouts, aliases and proxies
###

###
# Site Settings
###
# Set site setting, used in helpers / sitemap.xml / feed.xml.
set :protocol, "http://"
set :host, "www.vejerisimo.com/"
set :port, 80
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

# Slim settings
Slim::Engine.set_options :pretty => true
# shortcut
Slim::Engine.set_options :shortcut => {
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
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
activate :directory_indexes
activate :i18n, :langs => [:en, :es, :fr, :nl, :de], :mount_at_root => false
activate :middleman_simple_thumbnailer
# activate :bower
# Use relative URLs
# activate :relative_assets
# sprockets for bower components
activate :sprockets
sprockets.append_path File.join(root, 'bower_components')


# Reload the browser automatically whenever files change
configure :development do
  set :port, 4567
  activate :livereload
  # Used for generating absolute URLs # middleman 3
  # set :host, Middleman::PreviewServer.host
  # set :port, Middleman::PreviewServer.port
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # minify html
  activate :minify_html

  # create gzip variants
  # activate :gzip

  # Enable cache buster
  # activate :asset_hash

  # activate :imageoptim do |options|
  #   # Use a build manifest to prevent re-compressing images between builds
  #   options.manifest = true
  #   # Silence problematic image_optim workers
  #   options.skip_missing_workers = true
  #   # Cause image_optim to be in shouty-mode
  #   options.verbose = false
  #   # Setting these to true or nil will let options determine them (recommended)
  #   options.nice = true
  #   options.threads = true
  #   # Image extensions to attempt to compress
  #   options.image_extensions = %w(.png .jpg .gif .svg)
  #   # Compressor worker options, individual optimisers can be disabled by passing
  #   # false instead of a hash
  #   options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
  #   options.pngout    = { :copy_chunks => false, :strategy => 0 }
  #   options.pngout    = false
  #   options.svgo      = {}
  #   options.svgo      = false
  #   options.advpng    = { :level => 4 }
  #   options.gifsicle  = { :interlace => false }
  #   options.jpegoptim = { :allow_lossy => true, :strip => ['all'], :max_quality => 80 }
  #   options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
  #   options.optipng   = { :level => 6, :interlace => false }
  # end
end

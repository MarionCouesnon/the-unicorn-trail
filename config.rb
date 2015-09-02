activate :blog do |blog|
  blog.layout = 'article'
  blog.sources = 'articles/{year}-{month}-{day}-{title}'
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  set :build_dir, 'tmp'
  activate :asset_hash
  activate :minify_css
end

activate :deploy do |deploy|
end

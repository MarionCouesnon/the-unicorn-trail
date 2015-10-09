activate :blog do |blog|
  blog.layout = 'article'
  blog.sources = 'articles/{year}-{month}-{day}-{title}'
  blog.permalink = '{title}'
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
  deploy.method = :git
  deploy.build_before = true
end

configure :development do
 activate :livereload
end

helpers do
  def link_to_previous_article(text)
    if !current_article.previous_article.blank?
      link_to text, current_article.previous_article.url
    end
  end

  def link_to_next_article(text)
    if !current_article.next_article.blank?
      link_to text, current_article.next_article.url
    end
  end
end

activate :blog do |blog|
  blog.layout = 'article'
  blog.sources = 'articles/{year}-{month}-{day}-{title}'
  blog.permalink = '{title}'
end

set :relative_links, true
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

configure :build do
  activate :relative_assets
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
      link_to text, "/the-unicorn-trail#{current_article.previous_article.url}"
    end
  end

  def link_to_next_article(text)
    if !current_article.next_article.blank?
      link_to text, "/the-unicorn-trail#{current_article.next_article.url}"
    end
  end
end

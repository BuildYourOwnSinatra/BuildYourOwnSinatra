Slim::Engine.disable_option_validator!
Slim::Engine.set_options pretty: true, sort_attrs: false

require_relative 'lib/helpers'

ENV['RACK_ENV']         ||= 'development'
ENV['GITHUB_USER']      ||= 'BuilYourOwnSinatra'
ENV['PREVIEW_CHAPTERS'] ||= 'introduction setting-up-a-development-environment rack designing-your-framework paterrns-with-your-framework'

## Index
page '/index.html',   layout: :main
page '/full.html',    layout: :main
page '/error.html',   layout: :main
page '/upgrade.html', layout: :main

## Chapters
page 'chapters/*', layout: :chapter

## HTML Used For Generating PDF/EPub/Mobi
page '/pdf.html',            layout: :ebook
page '/pdf-with-bonus.html', layout: :ebook

set :markdown_engine, :kramdown
set :markdown, input: 'GFM', syntax_highlighter: 'rouge'

set :css_dir,        'css'
set :js_dir,         'js'
set :images_dir,     'images'
set :fonts_dir,      'fonts'
set :build_dir,      'build/html'
set :relative_links, true

activate :relative_assets

activate :blog do |blog|
  blog.sources   = 'chapters/:title.html'
  blog.permalink = 'chapters/:slug.html'
end

configure :development do
  ENV['RACK_ENV'] ||= 'development'
end

configure :build do
  compass_config do |config|
    config.sass_options = {:debug_info => false, :line_comments => false}
  end
end

helpers(Helpers)

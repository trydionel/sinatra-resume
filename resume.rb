require 'rubygems'
require 'compass'
require 'compass-colors'
require 'fancy-buttons'
require 'sinatra'
require 'haml'
require 'sass'
require 'md5'

configure :development do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
    config.images_dir = 'images'
  end
end

configure do  
  set :haml, { :format => :html5, :layout => :'layouts/application' }
  set :sass, Compass.sass_engine_options
end

helpers do
  def gravatar_link(email, size=80)
    "http://www.gravatar.com/avatar/#{MD5::md5(email.downcase)}?s=#{size}"
  end
  
  def partial(page, options = {})
    haml page, options.merge!(:layout => false)
  end
end

get '/gravatar' do
  gravatar_link("trydionel@gmail.com")
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

get '/' do
  haml :resume
end
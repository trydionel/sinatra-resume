require 'rubygems'
require 'compass'
require 'compass-colors'
require 'fancy-buttons'
require 'sinatra'
require 'haml'
require 'sass'
require 'md5'

configure do
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
  def data(source='data.yaml')
    @data ||= YAML.load_file(source)
  end
  
  def gravatar_link(email, size=80)
    "http://www.gravatar.com/avatar/#{MD5::md5(email.downcase)}?s=#{size}"
  end
  
  def partial(page, options = {})
    haml :"partials/_#{page}", options.merge!(:layout => false)
  end
  
  def highlight(text)
    highlighter = '<span class="keyword">\1</span>'
    phrases = data["keywords"]
    
    if text.blank? || phrases.empty?
      text
    else
      match = Array(phrases).map { |p| Regexp.escape(p) }.join('|')
      text.gsub(/(#{match})(?!(?:[^<]*?)(?:["'])[^<>]*>)/i, highlighter)
    end
  end
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

get '/' do
  @sections = data["sections"]
  haml :resume
end
require 'sinatra'

class MyApp < Sinatra::Application

  get '/' do
    File.read('./views/index.html')
  end

  get '/about' do
    File.read('./views/about.html')
  end

end

MyApp.run!

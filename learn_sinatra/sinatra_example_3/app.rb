require 'sinatra'

class MyApp < Sinatra::Application

  get '/' do
    File.read('index.html')
  end

end

MyApp.run!

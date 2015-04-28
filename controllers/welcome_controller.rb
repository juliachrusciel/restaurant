class WelcomeController < Sinatra::Base
  enable  :sessions
  helpers Sinatra::SessionHelper

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)


  # ***** Debugging *****
  get '/pry' do
    binding.pry
  end

  # ***** ROUTES *****
  get '/' do
    erb :index
  end

  get '/admin' do
    if current_user
      erb :admin_authenticated
    else
      erb :admin_non_authenticated
    end
  end

end

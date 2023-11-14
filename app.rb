require './idea'

class IdeaBoxApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :server, :webrick


  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  post '/' do
    idea = Idea.new(params['idea_title'], params['idea_description']) # 1. Create an idea based on the form parameters
    idea.save        # 2. Store it
    redirect '/'     # 3. Send us back to the index page to see all ideas
  end

end

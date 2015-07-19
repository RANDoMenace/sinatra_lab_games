class Games < Sinatra::Base

  # root route
  get "/" do
    redirect('/games')
  end

  #about page
  get "/about" do
    erb(:about)
  end

  #index
  get '/games' do
    @games = Game.all
    erb(:"games/index")
  end

  #new
  get '/games/new' do
    @game = Game.new
    erb(:"games/new")
  end

  #create
  post '/games' do
    @game = Game.new(params[:game])
    if @game.save
      redirect("/games/#{@games.id}")
    else
      erb(:"games/new")
    end
  end

  #show
  get '/songs/:id' do
    @game = Game.find(params[:id])
    erb(:"games/show")
  end

  #edit
  put '/games/:id/edit' do
    @game = Game.find(params[:id])
    erb(:"games/edit")
  end

  #update
  put '/song/:id' do
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect("/games")
    else
      erb(:"games/new")
    end
  end

  #destroy
  delete '/games/:id' do
    @game = Game.find(params[:id])
    if @game.destroy
      redirect('/games')
    else
      redirect("/games/#{@games.id}")
    end
  end

end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/musics' do
		@musics = Music.all
	erb :'musics/index'
end

get '/musics/new' do
	erb :'musics/new'
end

post '/musics' do
	@music = Music.new(
		song_title: params[:song_title],
		author: params[:author],
		url: params[:url]
		)
	if @music.save
redirect '/musics'
	else
		erb :'musics/new'
	end	
end

get '/musics/:id' do
	@music = Music.find params[:id]
	erb :'musics/show'
end


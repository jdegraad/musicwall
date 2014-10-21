# Homepage (Root path)
require 'pry'

get '/' do
  erb :index
end

get '/musics' do
	@musics = Music.order(upvotes: :desc)
	# binding.pry
	# erb :'musics/index'
	session[:user] = session[:user] ###'KV'
  	# erb musics/:index # render
  	erb :'musics/index'
end

get '/signin' do
  erb :signin
end

post '/signin' do
  session[:user] = params[:users_name]
  redirect '/musics'
end

get '/logout' do
	session.clear
	redirect '/'
end

# Example of a simple action that doesnt leverage ERB
# get '/yo/:name' do
#   name = params[:name]
#   "<html><body><p>hey there, #{name.upcase}</p></body></html>"
# end

get '/musics/new' do
	erb :'musics/new'
end

post '/musics/:music_id/upvotes' do
  @music = Music.find(params[:music_id])
  @music.upvotes ||= 0
  @music.upvotes += 1
  # @upvote = @music.upvotes.new(user: current_user)
  @music.save
  redirect '/musics'
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




require 'debugger'

get '/' do
	erb :front_page
end

get '/login' do
	erb :login
end

post '/login' do
	 @user = User.find_by_email(params[:email])
	 login
end

get '/logout' do
	session.clear
	redirect '/'
end

get '/register' do
	erb :register
end

post '/users' do
	@first_name = params[:first_name]
	@last_name = params[:last_name]
	@email = params[:email]
	@password = params[:password]
	create_new_user
end

get '/users/:user_id/favorites' do
	@user = User.find(session[:id])
	erb :prof_fav
end

post '/remove/:park_num' do
	content_type :json
	camp = Campground.find_by_park_num(params[:park_num]).id
	user = session[:id]
	Favorite.where(user_id: user).where(campground_id: camp).first.destroy
	{park_id: params[:park_num]}.to_json
end

get '/campgrounds' do
	erb :campgrounds
end

post '/add_fav' do
	content_type :json
		@user = User.find(session[:id])
    @campground = Campground.where(park_num: params[:park_num])
    @user.campgrounds << @campground
  {park_id: params[:park_num]}.to_json
end

post '/campgrounds' do
	  @amenity = params[:amenity]
	  @state = params[:state]
	  @site_type = params[:site_type]
	  @pets = params[:pets]
	  @water = params[:water_fornt]
	  @name = params[:park_name].upcase

	  url = "http://api.amp.active.com/camping/campgrounds/?pstate=#{@state}&pname=#{@name}&siteType=#{@site_type}&amenity=#{@amenity}&pets=#{@pets}&waterfront=#{@water}&api_key=hyywz8fhebjc8exgffdqm8qe"

	  query_campgrounds = xml_parser(url)

	  if query_campgrounds != nil
		  park_ids = store_campgrounds(query_campgrounds)
		  @campgrounds = []
		  park_ids.each do |num|
			  @campgrounds << Campground.where(park_num: num)
		  end
		  @campgrounds

		  erb :campgrounds
	  else
	  	erb :campgrounds_nil
	  end
end







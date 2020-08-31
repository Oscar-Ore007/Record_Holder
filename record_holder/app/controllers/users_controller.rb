class UsersController < ApplicationController 
  
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/users/error'
    
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save 
            session[:user_id] = @user.id
            redirect '/login'
        end
        
    end

    get '/users/error' do 
        erb :'users/error'
    end 

    get '/users/:id' do 
        @user = User.find_by(params[:id])
        erb :'users/show'
    end 

    get '/login' do 
        if !logged_in?
            erb :'users/login'
        else 
            redirect '/records'
        end 
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
           redirect '/records'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
       if logged_in?
        session.clear
        redirect '/'
       end 
    end
    
end
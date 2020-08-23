class RecordsController < ApplicationController 

    get '/records' do 
        if logged_in?
            @record = Record.all 
            erb :'records/index'
        else
            redirect '/login'
        end 
    end 

    get '/records/new' do 
        if logged_in?
            erb :'/records/new'
        else 
            redirect '/login'
        end 
    end 

    post '/records' do 
        @record = current_user.records.create(params)
        redirect "/records/#{@record.id}"
    end 

    get '/records/:id' do 
        if logged_in?
            @record = Record.find_by_id(params[:id])
            erb :'/record/show'
        else 
            redirect '/login'
        end 
    end 


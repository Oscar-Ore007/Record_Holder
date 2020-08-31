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
        @record = current_user.records.new(params)
        if @record.save 
        redirect "/records/#{@record.id}"
       else 
        redirect '/records/new'
       end 
    end 

    get '/records/:id' do 
        if logged_in?
            @record = Record.find_by_id(params[:id])
            erb :'/records/show'
        else 
            redirect '/login'
        end 
    end 


    get '/records/:id/edit' do 
        if logged_in?
            @record = Record.find_by_id(params[:id])
            if @record && @record.user == current_user 
                erb :'records/edit'
            else 
                redirect '/records'
            end
        else 
            redirect '/login'
        end 
    end 

    patch '/records/:id' do 
        if logged_in?
            if params[:album_name] == ""
                redirect "/records/#{params[:id]}/edit"
            else 
                @record = Record.find_by_id(params[:id])
                params.delete(:_method)
                if @record && @record.user == current_user 
                    if @record.update(params)
                        redirect "/records/#{@record.id}"
                    else 
                    redirect "/records/#{@record.id}/edit"
                end
                redirect "/records"
            end 
        end 
        else 
            redirect '/login'
        end 
    end 

    delete '/records/:id' do 
        if logged_in?
            @record = Record.find_by_id(params[:id])
            if @record && @record.user == current_user 
                @record.delete
            end
                redirect '/records'
        else 
            redirect '/login'
        end 
    end
end 

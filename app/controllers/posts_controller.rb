class PostsController < ApplicationController
    
    get '/posts' do
        authenticate
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do
        authenticate
        erb :'posts/new'
    end

    post '/posts' do
        authenticate
        u = current_user
        u.posts.build(content: params[:content])
        if u.save
            redirect '/posts'
        else
            @messages = "There was an issue"
            erb :'/posts/new'
        end
    end









end 
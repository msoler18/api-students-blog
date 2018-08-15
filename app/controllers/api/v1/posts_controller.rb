class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :basic_auth
  def index
    posts = Post.all
    render json: posts
  end
  
  def create
    post = Post.new(posts_params)
    if post.save
      render json: post
    else
      render json: {errors: post.errors}, status: 422  
    end
  end

  def update
    post = post.find(params[:id])
    if post.update(posts_params)
      render json: post
    else
      render json: {errors: post.errors}, status: 422  
    end  
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    head :no_content
  end


    
  private
  def posts_params
    params.permit(:title,:content)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user == "pepito" && password == "test123"
    end
  end
end
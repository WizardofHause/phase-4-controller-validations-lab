class PostsController < ApplicationController
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  ## RETURNS a nil object
  # def update
  #   post = Post.find(params[:id])
  #   if post.valid?
  #     post.update(post_params)
  #     render json: post, status: :ok
  #   else
  #     render json: { errors: post.errors }, status: :unprocessable_entity
  #   end
  # end

  # RETURNS error messages as a HASH
  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  ## RETURNS error messages as an ARRAY
  # def render_unprocessable_entity_response(invalid)
  #   render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  # end

end

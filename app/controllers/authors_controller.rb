class AuthorsController < ApplicationController
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  ## RETURNS a nil object
  # def create
  #   author = Author.create(author_params)
  #   if author.valid?
  #     render json: author, status: :created
  #   else
  #     render json: { errors: author.errors }, status: :unprocessable_entity
  #   end
  # end

  # RETURNS error messages as a HASH
  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  ## RETURNS error messages as an ARRAY
  # def render_unprocessable_entity_response(invalid)
  #   render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  # end
  
end

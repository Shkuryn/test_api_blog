module Api
  module V1
    class CommentsController < ApplicationController
      # GET /comments
         def index
           if params[:article_id]
             @comments = Comment.with_article(params[:article_id])
             render json: @comments
           end
         end
    end
  end
end

#
# class CommentsController < ApplicationController
#   before_action :set_comment, only: [:show, :update, :destroy]
#
#
#
#   # GET /comments/1
#   def show
#     render json: @comment
#   end
#
#   # POST /comments
#   def create
#     @comment = Comment.new(comment_params)
#
#     if @comment.save
#       render json: @comment, status: :created, location: @comment
#     else
#       render json: @comment.errors, status: :unprocessable_entity
#     end
#   end
#
#   # PATCH/PUT /comments/1
#   def update
#     if @comment.update(comment_params)
#       render json: @comment
#     else
#       render json: @comment.errors, status: :unprocessable_entity
#     end
#   end
#
#   # DELETE /comments/1
#   def destroy
#     @comment.destroy
#   end
#
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @comment = Comment.find(params[:id])
#     end
#
#     # Only allow a list of trusted parameters through.
#     def comment_params
#       params.fetch(:comment, {})
#     end
# end

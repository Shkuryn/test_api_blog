module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, only: [:show, :update, :destroy]

      # GET /articles
      def index
        @articles = Article.find_by_sql(get_query_text)
        render json: @articles
      end

      # GET /articles/1
      def show
        render json: @article
      end

      # POST /articles
      def create
        @article = Article.new(article_params)

        if @article.save
          render json: @article, status: :created, location: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /articles/1
      def update
        if @article.update(article_params)
          render json: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # DELETE /articles/1
      def destroy
        @article.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.fetch(:article, {})
      end

      def  get_query_text
        sql =
          "SELECT articles.id,
                 articles.header,
                 CASE
        WHEN Bit_length(articles.body) > 500 THEN Substring(articles.body FROM 1
        FOR 100)
        || '...'
        ELSE articles.body
      end           AS body,
                       articles.created_at,
                       Count(c.body) AS comments_count
      FROM   articles
      LEFT JOIN comments c
      ON articles.id = c.article_id
      GROUP  BY articles.id
      ORDER  BY created_at DESC"
      end

    end
  end
end



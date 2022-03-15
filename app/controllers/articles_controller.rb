class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def articles_json
    @articles = Article.all
    render json: @articles.to_json
  end
end

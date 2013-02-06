class ArticlesController < ApplicationController

  respond_to :json, :xml

  def index
    @articles = Article.all.includes(:user).page(params[:page]).per(5)
    respond_with @articles
  end

  def show
    @article = Article.find_by_slug(params[:id])
    respond_with @article
  end

end
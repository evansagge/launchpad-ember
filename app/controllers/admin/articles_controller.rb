class Admin::ArticlesController < Admin::BaseController

  respond_to :html, :json, :xml

  def index
    @articles = Article.page(params[:page]).per(10)
    respond_with :admin, @articles
  end

  def new
    @article = Article.new
    respond_with :admin, @article
  end

  def create
    @article = Article.create(params[:article])
    flash[:notice] = "Your article has been posted." unless @article.errors.any?
    respond_with :admin, @article
  end

  def show
    @article = Article.find_by_slug(params[:id])
    respond_with :admin, @article
  end

  def edit
    @article = Article.find_by_slug(params[:id])
    respond_with :admin, @article
  end

  def update
    @article = Article.find_by_slug(params[:id])
    @article.update_attributes(params[:article])
    flash[:notice] = "Your article has been updated." unless @article.errors.any?
    respond_with :admin, @article
  end

  def destroy
    @article = Article.find_by_slug(params[:id])
    @article.destroy
    flash[:notice] = "Your article has been deleted."
    respond_with :admin, @article
  end
end

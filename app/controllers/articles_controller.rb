class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find_by(id: params[:id])
  end
  
  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find_by(id: params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save
    # redirect_to articles_path(@article)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def update
    # @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully created."
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find_by(id: params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find_by(id: params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
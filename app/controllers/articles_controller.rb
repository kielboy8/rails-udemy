class ArticlesController < ApplicationController
  def index
  
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
  
  def new
    @article = Article.new
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

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
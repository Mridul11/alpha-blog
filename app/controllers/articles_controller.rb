class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id]), use set_article method
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article is successfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id]), use set_article method
    if @article.update(article_params)
      flash[:success] = "Article is successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    #@article = Article.find(params[:id]), use set_article method
  end

  def destroy
    #@article = Article.find(params[:id]), use set_article method
    @article.destroy
      flash[:danger] = "Article successfully deleted."
    redirect_to articles_path
  end

  private
    def set_article
      @article =Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

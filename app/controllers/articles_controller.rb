class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      params[:article] = @article
      flash[:message] = "Article '#{@article.title}' successfully created"
      redirect_to articles_path
    else
      redirect_to new_article_path(@article)
    end
  end

  def new
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update_attributes(params[:article])
      flash[:message] = "Article '#{@article.title}' was successfully updated"
      redirect_to articles_path
    else
      redirect_to edit_article_path(:id => params[:id])
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.delete
    flash[:message] = "Article successfully deleted"
    redirect_to articles_path
  end

end

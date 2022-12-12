class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.active.order("#{sort_column} #{sort_direction}")
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_url, success: t('.success', item: @article.title)
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_url, notice: "記事「#{@article.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.current
      @article.update_column(:deleted_at, now)
    end

    redirect_to articles_url, notice: "記事「#{@article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author, :deleted_at)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def sort_column
    params[:sort] || 'created_at'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end

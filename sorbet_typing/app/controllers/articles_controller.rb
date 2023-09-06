# frozen_string_literal: true
# typed: strict

# Article model
class ArticlesController < ApplicationController
  extend T::Sig

  http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]

  sig { returns(T.untyped) }
  def index
    @articles = T.let(Article.all, T.nilable(Article::PrivateRelation))
  end

  sig { returns(T.untyped) }
  def show
    @article = T.let(Article.find(params[:id]), T.nilable(Article))
  end

  sig { returns(T.untyped) }
  def new
    @article = Article.new
  end

  sig { returns(T.untyped) }
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  sig { returns(T.untyped) }
  def edit
    @article = Article.find(params[:id])
  end

  sig { returns(T.untyped) }
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  sig { returns(T.untyped) }
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end

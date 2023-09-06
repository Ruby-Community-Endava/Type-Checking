# frozen_string_literal: true
# typed: strict

# Comments controller
class CommentsController < ApplicationController
  extend T::Sig

  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  sig { returns(T.untyped) }
  def create
    # 2. But what about here?
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  sig { returns(T.untyped) }
  def destroy
    # 1. Definition here
    @article = T.let(Article.find(params[:article_id]), T.nilable(Article))

    if @article.nil?
      return redirect_to articles_path, status: :unprocessable_entity
    end

    @comment = T.let(@article.comments.find(params[:id]), T.nilable(Comment))
    @comment&.destroy
    
    redirect_to article_path(@article), status: :see_other
  end

  private

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end

class CommentsController < ApplicationController
  def index
  	@comments = Comment.select("*").joins(:product)
  	@dates = Comment.select("created_at").strftime(%m-%d-%Y)
  end
  def create
  	Comment.create(comment: params[:comment], product: Product.find(params[:id]))
  	redirect_to "/products/%d" % params[:id]
  end
end

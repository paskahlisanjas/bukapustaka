class BooksController < ApplicationController

  def show
    @books = Book.find(params[:id])
    render json: @books.jsonify, status: :ok
  end

  def showseveral
    @books = []
    Book.find_each(start: params[:start], finish: params[:finish]) do |book|
      @books << book.jsonify
    end
    render json: @books, status: :ok
  end

end

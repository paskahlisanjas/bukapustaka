class BooksController < ApplicationController

  def show
    begin
      @books = Book.find(params[:id])
      render json: @books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the book with id = ' + params[:id] }, status: 404
    end
  end

  def showall
    @books = []
    Book.all.each do |book|
      @books << book.jsonify
    end
    render json: @books, status: :ok
  end

  def showseveral
    @books = []
    Book.find_each(start: params[:start], finish: params[:finish]) do |book|
      @books << book.jsonify
    end
    render json: @books, status: :ok
  end

  def borrow
    begin
      @books = Book.find(params[:id])
      @books.stock -= 1
      if @books.stock < 0
        render json: { message: 'The book is out of stock' }, status: :ok
        return
      end
      @books.save
      render json: @books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the book with id = ' + params[:id] }, status: :ok
    end
  end

  def return
    begin
      @books = Book.find(params[:id])
      @books.stock += 1
      @books.save
      render json: @books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the book with id = ' + params[:id] }, status: :ok
    end
  end

end

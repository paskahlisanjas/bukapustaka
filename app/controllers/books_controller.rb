  class BooksController < ApplicationController
  def show
    begin
      books = Book.find(params[:id])
      render json: books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the book with id = ' + params[:id] }, status: 404
    end
  end

  def showall
    books = []
    Book.all.each do |book|
      books << book.jsonify
    end
    render json: books, status: :ok
  end

  def showseveral
    books = []
    Book.find_each(start: params[:start], finish: params[:finish]) do |book|
      books << book.jsonify
    end
    render json: books, status: :ok
  end

  def borrow
    auth_result = authorize
    unless auth_result[:authorized]
      render :json => { :message => auth_result[:message] }, :status => :unauthorized
      return
    end

    begin
      books = Book.find(params[:id])
      books.stock -= 1
      if books.stock < 0
        render json: { message: 'The book is out of stock' }, status: :ok
        return
      end
      Borrow.create!({
          :user_id => auth_result[:user_id],
          :book_id => params[:id],
          :expiry_date => 72.hours.from_now
      })
      books.save
      render json: books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the book with id = ' + params[:id] }, status: :ok
    end
  end

  def return
    auth_result = authorize
    unless auth_result[:authorized]
      render :json => { :message => auth_result[:message] }, :status => :unauthorized
      return
    end

    begin
      borrow = Borrow.find(params[:borrow_id])
      books = Book.find(borrow.book_id)
      books.stock += 1
      borrow.destroy
      books.save
      render json: books.jsonify, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the record' }, status: 404
    end
  end

  def borrowed
    auth_result = authorize
    unless auth_result[:authorized]
      render :json => { :message => auth_result[:message] }, :status => :unauthorized
      return
    end

    begin
      books = []
      Borrow.where(user_id=auth_result[:user_id].to_s).find_each do |borrow|
        book = Book.find(borrow.book_id).jsonify
        book[:borrow_id] = borrow.id
        book[:borrowed_at] = borrow.created_at
        book[:expired_at] = borrow.expiry_date
        books << book
      end
      render :json => books, :status => :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Could not find the record' }, status: 404
    end
  end

end

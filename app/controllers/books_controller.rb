class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
  end



  def show
    @book = Book.find(params[:id])
  end



  def create
   @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
     @books = Book.all.order(created_at: :desc)
     render :index
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id),notice: "Book was successfully updated."

  end

  def destroy

  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end



class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params_book)
    if @book.save
      redirect_to book_path(@book, params: { process: :creation })
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update!(params_book)
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path(params: { process: :delete })
  end

  private

  def params_book
    params.require(:book).permit(:name, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end

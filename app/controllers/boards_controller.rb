class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end
  
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destory
    @board.destory
    redirect_to boards_path
  end


  private
    def board_params
      params.require(:board).permit(:work, :chores)
    end

    def set_board
      @board = current_user.boards.find(params[:id])
    end
end

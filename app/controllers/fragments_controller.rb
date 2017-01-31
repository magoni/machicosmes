class FragmentsController < ApplicationController
  def index
    @fragments = Fragment.all
  end

  def show
    @fragment = Fragment.find(params[:id])
  end

  def new
    @fragment = Fragment.new
  end

  def edit
    @fragment = Fragment.find(params[:id])
  end

  def create
    @fragment = Fragment.new(fragment_params)

    if @fragment.save
      redirect_to @fragment
    else
      render 'new'
    end
  end

  private
    def fragment_params
      params.require(:fragment).permit(:title, :text)
    end
end

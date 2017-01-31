class FragmentsController < ApplicationController
  def index
    @fragments = Fragment.all
  end

  def random
    @fragment = Fragment.offset(rand(Fragment.count)).first
    redirect_to @fragment
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

  def update
    @fragment = Fragment.find(params[:id])

    if @fragment.update(fragment_params)
      redirect_to @fragment
    else
      render 'edit'
    end
  end

  def destroy
    @fragment = Fragment.find(params[:id])
    @fragment.destroy

    redirect_to fragments_path
  end

  private
    def fragment_params
      params.require(:fragment).permit(:title, :text)
    end
end

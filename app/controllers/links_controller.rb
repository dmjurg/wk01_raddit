class LinksController < ApplicationController

  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to @link, notice: 'Link was successfully created'
    else
      render :new, notice: 'There was a problem creating your link'
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully removed'
  end

  private def set_link
    @link = Link.find(params[:id])
  end

  private def link_params
    params.require(:link).permit(:title, :url)
  end

end

class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def create
    link = Link.create

    flash[:success] = "Shortened"
    redirect_to '/'
  end

  def edit
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
  end
end

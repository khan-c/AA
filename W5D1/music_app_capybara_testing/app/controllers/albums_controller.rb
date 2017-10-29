class AlbumsController < ApplicationController
  def new
    @bands = Band.all.order(:id)
    @band = Band.find_by(id: params[:id])
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      @bands = Band.all.order(:id)
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.delete
    @album
    render :show
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end

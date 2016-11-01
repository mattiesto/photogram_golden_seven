class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({ :id=>params[:id]})
  end

  def new_form
    render ("/photos/new_form.html.erb")
  end

  def create_row
    p=Photo.new
    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    redirect_to("/photos")
  end

  def destroy
    i=Photo.find_by({ :id=>params[:id]})
    i.destroy

    redirect_to("/photos")
  end

  def edit_form
    @photo = Photo.find_by({ :id=>params[:id]})

  end

  def update_row
    i=Photo.find_by({ :id=>params[:id]})
    i.caption = params[:the_caption]
    i.source = params[:the_source]
    i.save
    @photo = Photo.find_by({ :id=>params[:id]})
    redirect_to("/photos/#{@photo.id}")

  end
   
end

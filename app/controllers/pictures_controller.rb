class PicturesController < ApplicationController
  def index
    @photo_list = Photo.all.order({:created_at => :desc})
    
    render("pic_templates/all_photos.html.erb")
  end
  
  def new_form
    render("pic_templates/add_new_photo.html.erb")
  end
  
  def create_row
    p = Photo.new
    p.source = params.fetch("the_source")
    p.caption = params.fetch("the_caption")
    
    p.save
    
    @photo_count = Photo.count
    # render("pic_templates/add_new_photo_confirmation.html.erb")
    redirect_to("/photos")
  end
  
  def show_details
    photo_id = params.fetch("photo_id")
    @the_photo = Photo.find(photo_id)

    render("pic_templates/photo_details.html.erb")
  end
  
  def edit_form
    the_id = params.fetch("photo_id")
    @photo_to_edit = Photo.find(the_id)
    render("pic_templates/edit_photo.html.erb")
  end
  
  def edit_row
    the_id = params.fetch("photo_id")
    photo_to_edit = Photo.find(the_id)
    photo_to_edit.source = params.fetch("the_source")
    photo_to_edit.caption = params.fetch("the_caption")
    photo_to_edit.save
    # render("pic_templates/edit_photo_confirmation.html.erb")
    redirect_to("/photos/"+the_id)
  end
  
  def destroy_row
    the_id = params.fetch("photo_id")
    the_photo = Photo.find(the_id)
    
    the_photo.destroy
    
    @photo_count = Photo.count
    # render("pic_templates/delete_photo.html.erb")
    redirect_to("/photos")
  end
end
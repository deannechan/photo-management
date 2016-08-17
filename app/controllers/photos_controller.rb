class PhotosController < ApplicationController

 # def new
 #   id = params[:id]
 #   customer = Customer.find(id)
 #   @data = {
 #     customer: customer,
 #   }
 #
 # end
 def new
    @photo = Photo.new
    id = params[:customer_id]
    @customer = Customer.find(id)
  end

  def create
    @photo = Photo.new(photo_params)
    id = params[:customer_id]
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to("/customer/"+id)
    else
      render 'new'
    end
  end

  def show
  end

 # def create
 #   photo = {
 #     name: params[:name],
 #     image: params[:image],
 #     user_id: params[:user_id],
 #   }
 #   params.permit(:image, :name, :user_id)
 #   @photo = Photo.new(photo)
 #   if @photo.save
 #     flash[:success] = "The photo was added!"
 #     redirect_to("/photos/show")
 #   else
 #     render 'new'
 #   end
 # end
 def gallery
   @photos = Photo.order('created_at')
 end

 def destroy
   @photo = Photo.find(params[:id])
   @photo.destroy
   flash[:success] = "The photo was destroyed."
   redirect_to root_path
 end

 private

 def photo_params
   params.require(:photo).permit(:image, :name, :user_id)
 end

end

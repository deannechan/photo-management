class CustomerController < ApplicationController
  include ErrorHelper

  def new
    @errors = get_errors
  end

  def create
    options = {
      name: params[:name],
      contactNumber: params[:contactNumber],
    }
    resp = Customer.new_post(options)

    if resp[:errors].length > 0
      session[:errors] = resp[:errors]
      redirect_to("/add")
    else
      redirect_to root_path
    end
  end

  def show
    id = params[:id]
    customer = Customer.find(id)
    photos = Photo.where(user_id: id).order('created_at')
    @data = {
      customer: customer,
      photos: photos,
      errors: get_errors
    }
  end

  def search
    name = params[:name]
    id = params[:id]
    if Customer.exists?(id: id)
      redirect_to("/customer/"+id)
    else
      redirect_to root_path
      session[:errors] = ["Can't find customer name #{name}."]
    end
  end

  autocomplete :customer, :name, :full => true
  # def autocomplete_customer_name
  #   term = params[:term]
  #   if term && !term.empty?
  #     @customer = Customer.order(:name)
  #     items = @customer.where("name LIKE ?", "%#{params[:term]}%")
  #   else
  #     items = {}
  #   end
  #   render :json => json_for_autocomplete(items, :name)
  # end

end

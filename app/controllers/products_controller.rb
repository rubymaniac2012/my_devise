class ProductsController < ApplicationController

  before_filter :self_load, :only=>[:show,:edit,:update,:destroy]

  before_filter :authenticate_user, :only=>[:edit,:update,:destroy]


   def index
    @products=Product.find(:all)
   end

   def new 
    @product=Product.new
   end

   def create
     @product=Product.new(params[:product])
     if @product.save
        redirect_to root_url, :notice=>'New Product has been added'
     else
        render :action=>'new'
     
     end
   end  
 
   def show
   end

   def edit
   end
  
   def update
    
    if @product.update_attributes(params[:product])
         redirect_to root_url, :notice=>'Product has been updated.'
      else
         render :action => 'edit'
      end
   end

   
  def destroy
    
    @product.destroy
    redirect_to root_url    
  end
 
  def self_load
    @product = Product.find(params[:id])
  end

  def authenticate_user
    if current_user
    else 
      redirect_to root_url, :notice=>'You are not logged in'
    end
  end
end


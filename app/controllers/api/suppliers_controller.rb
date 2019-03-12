class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @supplier = Supplier.find_by(:id the_id)
  end
end

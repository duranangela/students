class AddressesController < ApplicationController

  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.student_id = (params[:student_id])
    if @address.save
      redirect_to student_path(@address.student_id)
    else
      render new
    end
  end

  private

  def address_params
    params.require(:address).permit(:description, :street_address, :city, :state, :zip_code)
  end

end

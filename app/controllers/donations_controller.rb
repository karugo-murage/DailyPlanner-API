# class DonationsController < ApplicationController
# end
class DonationsController < ApplicationController
    def index
      @donations = Donation.where(user_id: params[:user_id])
      render json: @donations
    end
  
    def create
      @donation = Donation.new(donation_params)
      @donation.user_id = params[:user_id]
      if @donation.save
        render json: @donation, status: :created
      else
        render json: @donation.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def donation_params
      params.require(:donation).permit(:amount, :payment_method)
    end
  end
  
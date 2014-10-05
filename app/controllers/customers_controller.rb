class CustomersController < ApplicationController

def index
	@customers = Customer.all

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @customers}
      format.json { render json: @customers }
    end
end

def new
	@customer = Customer.new
end

def edit
	@customer = Customer.find(params[:id])

end

def create
	@customer = Customer.new(params[:customer_params])

	respond_to do |format|
		if @customer.save
			format.html { redirect_to customers_url, notice: "Customer Saved." }
		else
			format.html { render action: "new"}
			format.json { render json: @customer.errors, status: :unprocessable_entity }
		end
	end
end

def show
	@customer = Customer.find(params[:id])

end

def update
	@customer = Customer.find(params[:id])

end

def destroy
	@customer = Customer.find(params[:id])

end

private
def customer_params
  params.require[:customer].permit(:name)
end

end


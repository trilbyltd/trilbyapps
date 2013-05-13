class HostingRenewalsController < ApplicationController

  def index
    # @hostings = Hosting.find(params[:hosting_id])
    @hosting_renewals = HostingRenewals.find_by_id(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @resellers }
    end
  end

  def show
    @hosting_renewal = HostingRenewal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hosting_renewal }
    end
  end
  
  def new
    @hosting = Hosting.find_by_id(params[:hosting_id])
    @hosting_renewal = HostingRenewal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hosting_renewal }
    end
  end

  def create
    @hosting = Hosting.find(params[:hosting_id])
    @hosting_renewal = HostingRenewal.new(params[:hosting_renewal])

    respond_to do |format|
      if @hosting_renewal.save
        format.html { redirect_to hosting_url, notice: 'Domain Renewal was created.' }
        #format.json { render json: @reseller, status: :created, location: @reseller }
      else
        format.html { render action: "new" }
        format.json { render json: @hosting_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hosting = Hosting.find(params[:hosting_id])
    @hosting_renewal = HostingRenewal.find(params[:id])

     respond_to do |format|
      if @hosting_renewal.update_attributes(params[:hosting_renewal])
        format.html { redirect_to @hosting_renewal, notice: 'Domain Renewal was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hosting_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

# No Destroy entry

	def mark_paid #create new entry for following year
		@next_year = HostingRenewal.new
		@next_year.renewal_date = @hosting_renewal.date + 1.year
		@next_year.paid = false
		@next_year.save
	end

end

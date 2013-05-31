class RenewalsController < ApplicationController

  before_filter :load_hosting
  
  def index
    # @hostings = Hosting.find(params[:hosting_id])
    @renewals = Renewal.all
    @hostings = @hosting.hosting_renewals.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @resellers }
    end
  end

  def show
    @hosting_renewal = @hosting.hosting_renewals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hosting_renewal }
    end
  end
  
  def new
    @hosting_renewal = @hosting.hosting_renewals.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hosting_renewal }
    end
  end

  def create
    @hosting_renewal = @hosting.hosting_renewals.new(params[:hosting_renewal])

    respond_to do |format|
      if @hosting_renewal.save
        format.html { redirect_to [@hosting, @hosting_renewal], notice: 'Domain Renewal was created.' }
        #format.json { render json: @reseller, status: :created, location: @reseller }
      else
        format.html { render action: "new" }
        format.json { render json: @hosting_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @hosting_renewal = @hosting.hosting_renewals.find(params[:id])
  end

  def update
    @hosting_renewal = @hosting.hosting_renewals.find(params[:id])

     respond_to do |format|
      if @hosting_renewal.update_attributes(params[:hosting_renewal])
        format.html { redirect_to @hosting, notice: 'Domain Renewal was updated.' }
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


  private
  def load_hosting
    @hosting = Hosting.find(params[:hosting_id])  
  end
  
end

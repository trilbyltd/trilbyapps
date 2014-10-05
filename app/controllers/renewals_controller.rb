class RenewalsController < ApplicationController

  before_filter :load_domain

  def index
    # @hostings = Hosting.find(params[:hosting_id])
    @renewals = Renewal.all
    @domains = @domain.renewals.all

    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @resellers }
    end
  end

  def show
    @domain_renewal = @domain.domain_renewals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domain_renewal }
    end
  end

  def new
    @domain_renewal = @domain.renewals.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain_renewal }
    end
  end

  def create
    @domain_renewal = @domain.domain_renewals.new(params[:domain_renewal])

    respond_to do |format|
      if @domain_renewal.save
        format.html { redirect_to [@domain, @domain_renewal], notice: 'Domain Renewal was created.' }
        #format.json { render json: @reseller, status: :created, location: @reseller }
      else
        format.html { render action: "new" }
        format.json { render json: @domain_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @domain_renewal = @domain.domain_renewals.find(params[:id])
  end

  def update
    @domain_renewal = @domain.domain_renewals.find(params[:id])

     respond_to do |format|
      if @domain_renewal.update_attributes(params[:domain_renewal])
        format.html { redirect_to @domain, notice: 'Domain Renewal was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domain_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

# No Destroy entry

	def mark_paid #create new entry for following year
		@next_year = Renewal.new
		@next_year.renewal_date = @domain_renewal.date + 1.year
		@next_year.paid = false
		@next_year.save
	end


  private
  def load_domain
    @domain = Domain.where(:hosting_id => :id)
  end

end

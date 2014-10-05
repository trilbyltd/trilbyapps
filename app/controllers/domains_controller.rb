class DomainsController < ApplicationController

  def index
    @domains = Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @resellers }
    end
  end

  def show
    @domain = Domain.find(params[:id])
    @renewals = Renewal.where(:hosting_id => @domain.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domain }
    end
  end

  def new
    @domain = Domain.new
    @renewal = @domain.renewal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain }
    end
  end

  def create
    @domain = Domain.new(params[:domain])

    respond_to do |format|
      if @domain.save
        format.html { redirect_to domains_url, notice: 'Domain Record was successfully created' }
        # format.json { render json: @reseller, status: :created, location: @reseller }
      else
        format.html { render action: "new" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @domain = Domain.find(params[:id])

     respond_to do |format|
      if @domain.update_attributes(params[:domain])
        format.html { redirect_to @domain, notice: 'Domain Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain Registration record deleted.' }
      format.json { head :no_content }
    end
  end

end
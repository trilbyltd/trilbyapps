class HostingsController < ApplicationController

  def index
    @hostings = Hosting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @resellers }
    end
  end

  def show
    @hosting = Hosting.find(params[:id])
    @renewals = @hosting.renewals
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hosting }
    end
  end
  
  def new
    @new_host = Hosting.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new_host }
    end
  end

  def create
    @hosting = Hosting.new(params[:hosting])

    respond_to do |format|
      if @hosting.save
        format.html { redirect_to hostings_url, notice: 'Domain Record was successfully created.' }
        #format.json { render json: @reseller, status: :created, location: @reseller }
      else
        format.html { render action: "new" }
        format.json { render json: @hosting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hosting = Hosting.find(params[:id])

     respond_to do |format|
      if @hosting.update_attributes(params[:hosting])
        format.html { redirect_to @hosting, notice: 'Domain Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hosting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hosting = Hosting.find(params[:id])
    @hosting.destroy

    respond_to do |format|
      format.html { redirect_to hostings_url, notice: 'Domain Registration record deleted.' }
      format.json { head :no_content }
    end
  end

end
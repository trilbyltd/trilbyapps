class BookingsController < ApplicationController

  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      # format.ics { render :text => @bookings.to_ics, :mime_type => Mime::Type.lookup("text/calendar") }
      format.json { render json: @bookings }
    end
  end

  def archive
    @bookings = Booking.all

    respond_to do |format|
      format.html # archive.html.erb
      format.json { render json: @bookings }
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @reseller = Reseller.find(@booking.reseller_id)

    respond_to do |format|
      format.html # show.html.erb
      format.ics do
        calendar = Icalendar::Calendar.new
        calendar.add_event(@booking.to_ics)
        calendar.publish
        render :text => calendar.to_ical
      end
      format.json { render json: @booking }
    end
  end

  def new
    @booking = Booking.new
    @booking.training_confirmed = false
    @booking.invoice_sent = false
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    if Time.now.to_i - @booking.training_date.to_i > 0
        @completed = false
      end
  end


  def create
    @booking = Booking.new(params[:booking])
    
    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_url, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking deleted.' }
      format.json { head :no_content }
    end
  end


end

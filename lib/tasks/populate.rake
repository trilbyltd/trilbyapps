namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Reseller, Booking].each(&:delete_all)
      Reseller.populate 15 do |reseller|
      reseller.name = Populator.words(1..3).titleize

      Booking.populate 3..5 do |booking|
        booking.reseller_id = reseller.id
        # booking.customer_id = 
        booking.contact_name = Faker::Name.name
        booking.contact_email = Faker::Internet.email
        booking.training_date = 3.months.ago..9.months.from_now
        booking.length = [1, 0.5]
        booking.training_type = Populator.words(1..4)
        # booking.quote_id = 
        # booking.purchase_order = 
        booking.training_confirmed = [true, false]
        booking.training_approved = [true, false]
        booking.invoice_sent =  [true, false]
        booking.created_at = 1.year.ago..Time.now
      end
    end

    
    
   
  end
end
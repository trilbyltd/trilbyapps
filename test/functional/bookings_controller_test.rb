require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post :create, booking: { contact_email: @booking.contact_email, contact_name: @booking.contact_name, customer_id: @booking.customer_id, invoice_sent: @booking.invoice_sent, length: @booking.length, purchase_order: @booking.purchase_order, quote_id: @booking.quote_id, reseller_id: @booking.reseller_id, training_approved: @booking.training_approved, training_confirmed: @booking.training_confirmed, training_date: @booking.training_date, training_type: @booking.training_type }
    end

    assert_redirected_to booking_path(assigns(:booking))
  end

  test "should show booking" do
    get :show, id: @booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking
    assert_response :success
  end

  test "should update booking" do
    put :update, id: @booking, booking: { contact_email: @booking.contact_email, contact_name: @booking.contact_name, customer_id: @booking.customer_id, invoice_sent: @booking.invoice_sent, length: @booking.length, purchase_order: @booking.purchase_order, quote_id: @booking.quote_id, reseller_id: @booking.reseller_id, training_approved: @booking.training_approved, training_confirmed: @booking.training_confirmed, training_date: @booking.training_date, training_type: @booking.training_type }
    assert_redirected_to booking_path(assigns(:booking))
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete :destroy, id: @booking
    end

    assert_redirected_to bookings_path
  end
end

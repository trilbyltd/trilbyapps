class DomainServiceMailer < ActionMailer::Base
  default from: "support@trilby.net"

  def domain_renewal
  	@customer = Hosting.find_by([Customer.id]).name
  	@domain_name = Hosting.domain_name
  end

  def system_status
  	
  end

end

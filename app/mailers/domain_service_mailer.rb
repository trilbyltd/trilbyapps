class DomainServiceMailer < ActionMailer::Base
  default from: "support@trilby.net"

  def domain_renewal
  	@customer = Domain.find_by([Customer.id]).name
  	@domain_name = Domain.domain_name
  end

  def system_status
  	
  end

end

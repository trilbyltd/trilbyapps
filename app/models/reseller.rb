class Reseller < ActiveRecord::Base
  attr_accessible :name

  validates :name, :uniqueness => { :case_sensitive =>false }, :presence => true

def to_json(options={})
	{:resellers => self.resellers}
end

end



class Customer < ActiveRecord::Base
  has_many :photos, :dependent => :destroy

  def self.new_post(options)
    errors = []

    customer = Customer.create(options)
    {
      customer: customer,
      errors: errors ? errors : [],
    }
  end

end

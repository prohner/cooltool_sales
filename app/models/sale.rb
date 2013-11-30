class Sale < ActiveRecord::Base
  belongs_to :country
  belongs_to :app_version
  belongs_to :upload_file
  before_validation :before_validation_set_defaults, :only => [ :create, :update ]
  
  scope :unconverted_foreign_currency, lambda { where(:proceeds_in_dollars => nil).where("proceeds <> 0") }
  
  def developer_proceeds
    if is_paid_transaction
      if proceeds_in_dollars.nil? 
        proceeds.to_f
      else
        proceeds_in_dollars
      end
    else
      0
    end
  end
  
  def is_paid_transaction
    return true if product_type_identifier[0, 1] == "1" else return false
  end
  
  def developer_proceeds_is_usd
    not proceeds_in_dollars.nil? or proceeds == 0
  end
  
  def before_validation_set_defaults
    if is_paid_transaction
      if self.currency_of_proceeds == "USD"
        self.proceeds_in_dollars = proceeds
      else
        self.proceeds_in_dollars = app_version.app.default_proceeds_in_dollars
      end
    end
  end  
end

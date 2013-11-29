class Sale < ActiveRecord::Base
  belongs_to :country
  belongs_to :app_version
  belongs_to :upload_file
  
  def developer_proceeds
    if proceeds_in_dollars.nil? 
      proceeds.to_f
    else
      proceeds_in_dollars
    end
  end
  
  def developer_proceeds_is_usd
    not proceeds_in_dollars.nil? or proceeds == 0
  end
end

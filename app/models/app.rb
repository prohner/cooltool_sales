class App < ActiveRecord::Base
  has_many :app_versions, dependent: :destroy
  
  def sales_total
    total_sales = 0
    app_versions.each do |app_version|
      app_version.sales.each do |sale|
        total_sales += sale.developer_proceeds * sale.units
      end
    end
    total_sales
  end
end

class UploadFile < ActiveRecord::Base
  has_many :sales, dependent: :destroy
  scope :recently_uploaded, lambda { where("created_at >= ?", Date.today().days_ago(5)) }
  
  
  def self.sales_in_date_range(from, to)
    where("sales_date >= ? and sales_date <= ?", from, to)
  end
  
  def to_sales_grid_row
    apps = App.all.order("short_app_name")
    row = Array.new(apps.count)
    
    app_counter = 0
    apps.each do |app|
      row[app_counter] = 0
      sales.each do |sale|
        if sale.app_version.app == app
          unless sale.proceeds_in_dollars.nil? or sale.units.nil?
            row[app_counter] += sale.proceeds_in_dollars * sale.units
          end
        end
      end
      app_counter += 1
    end
    row
  end
  
  def total_sales
    total = 0
    sales.each do |sale|
      unless sale.proceeds_in_dollars.nil? or sale.units.nil?
        total += sale.proceeds_in_dollars * sale.units
      end
    end
    total
  end
end


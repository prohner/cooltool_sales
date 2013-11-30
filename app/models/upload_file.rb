class UploadFile < ActiveRecord::Base
  has_many :sales, dependent: :destroy
  
  def to_sales_grid_row
    apps = App.all.order("title")
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


class UploadFile < ActiveRecord::Base
  has_many :sales, dependent: :destroy
  
  def to_sales_grid_row
    apps = App.all.order("title")
    row = Array.new(apps.count)
    
    app_counter = 0
    apps.each do |app|
      sales.each do |sale|
        if sale.app_version.app == app
          puts "Found a sale"
          row[app_counter] = sale.proceeds.to_s('F') + "(#{app.title})"
        end
      end
      app_counter += 1
    end
    
    row
  end
end


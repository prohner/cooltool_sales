require 'csv'
class UploadController < ApplicationController
  def index
  end

  def upload
    rowarray = Array.new
    myfile = params[:file]

    CSV.foreach(myfile.path) do |row|
      rowarray << row[0].split("\t")
      @rows = rowarray
    end
    @headers = @rows.shift
    
    @rows.each do |row|
      app = App.find_by_sku(row[2])
      puts app
      if app.nil?
        puts "Adding NEW"
        app = App.new
        app.sku = row[2]
        app.title = row[4]
        app.apple_identifier = row[14]
        app.category = row[20]
        app.save
      end

      version = app.app_versions.find_by_version(row[5])
      if version.nil?
        version = app.app_versions.create(version: row[5])
        version.save!
      end

      sale = version.sales.create()
      sale.units = row[7]
      sale.proceeds = row[8]
      sale.sales_date = DateTime.strptime(row[9], "%m/%d/%Y")
      
      puts "Sales date is (#{sale.sales_date}) (#{row[9]})"
      sale.customer_currency = row[11]
      sale.currency_of_proceeds = row[13]
      sale.customer_price = row[15]

      country = Country.find_by_digraph(row[12])
      if country.nil?
        country = Country.new()
        country.country = row[12]
        country.digraph = row[12]
        country.save
      end
      sale.country = country
      
      sale.save
      version.save
      

    end
  end
end

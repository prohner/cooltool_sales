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
        
        version = app.app_versions.create(version: row[5])
        version.save
      end
        
      if app.app_versions.find_by_version(row[5]).nil?
        version = app.app_versions.create(version: row[5])
        version.save
      end
    end
  end
end

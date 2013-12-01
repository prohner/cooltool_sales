class WelcomeController < ApplicationController
  def index
    @apps = App.all.order("title")
    @upload_files = UploadFile.all.order("filename desc")
    @filecount = UploadFile.all.count
    @foreign_currency_sales = Sale.unconverted_foreign_currency
    
    @legend = [ ]
    @data = [ ]
    @title = "App Sales"
    @apps.each do |app|
      if app.sales_total > 0
        @legend << app.title
        @data << app.sales_total
      end
    end
  end
end

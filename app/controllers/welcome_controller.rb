include ActionView::Helpers::NumberHelper

class WelcomeController < ApplicationController
  def index
    
    ActiveRecord::Base.logger.level = 1
    
    event = params[:the_from_date]    
    if event.nil?
      @filter_from = Date.today.months_ago(1)
    else
      @filter_from = Date.new event["(1i)"].to_i, event["(2i)"].to_i, event["(3i)"].to_i
    end

    event = params[:the_to_date]    
    if event.nil?
      @filter_to = Date.today 
    else      
      @filter_to = Date.new event["(1i)"].to_i, event["(2i)"].to_i, event["(3i)"].to_i
    end

    
    @apps = App.all.order("title")
    @upload_files = UploadFile.sales_in_date_range(@filter_from, @filter_to).order("sales_date desc")
    @filecount = UploadFile.all.count
    @foreign_currency_sales = Sale.unconverted_foreign_currency
    @total_sales = 0

    @legend = [ ]
    @data = [ ]
    @title = "App Sales from #{@filter_from} through #{@filter_to}"
    @apps.each do |app|
      sales_total = app.sales_total_within_date_range(@filter_from, @filter_to)
      if sales_total > 0
        @total_sales += sales_total
        label = "#{app.title} (#{number_to_currency(sales_total)})"
        @legend << label
        @data << sales_total
      end
    end
  end
end

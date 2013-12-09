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

    
    @apps = App.all.order("short_app_name")
    @upload_files = UploadFile.sales_in_date_range(@filter_from, @filter_to).order("sales_date desc")
    @filecount = UploadFile.all.count
    @foreign_currency_sales = Sale.unconverted_foreign_currency
    @total_sales = 0

    legend = [ ]
    @data = [ ]
    @title = "App Sales from #{@filter_from} through #{@filter_to}"

    @units_legend = [ ]
    @units_data = [ ]
    @units_title = "Unit Sales from #{@filter_from} through #{@filter_to}"

    app_sales_total = [ ]
    @apps.each do |app|
      sales_total = app.sales_total_within_date_range(@filter_from, @filter_to)
      if sales_total > 0
        @total_sales += sales_total
        label = "#{app.short_app_name} "
        
        app_sales_total << sales_total
        legend << label
        @data << sales_total
      end

      units_total = app.units_total_within_date_range(@filter_from, @filter_to)
      if units_total > 0
        label = "#{app.short_app_name} (#{units_total})"
        @units_legend << label
        @units_data << units_total
      end

      unless @total_sales == 0 
        @legend = legend.zip(app_sales_total).map do |legend, sales| 
          legend = "#{legend} (#{number_to_currency(sales)}, #{number_to_percentage(sales/@total_sales*100, precision: 1)})" 
        end
      end
    end
  end
end

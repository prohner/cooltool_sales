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
  end
end

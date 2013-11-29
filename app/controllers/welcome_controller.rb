class WelcomeController < ApplicationController
  def index
    @apps = App.all.order("title")
    @upload_files = UploadFile.all.order("filename desc")
    @filecount = UploadFile.all.count
    
  end
end

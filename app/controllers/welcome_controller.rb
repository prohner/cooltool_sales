class WelcomeController < ApplicationController
  def index
    @apps = App.all.order("title")
    @filecount = UploadFile.all.count
    @upload_files = UploadFile.all.order("filename desc")
    
  end
end

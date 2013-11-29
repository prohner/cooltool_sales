class WelcomeController < ApplicationController
  def index
    @apps = App.all
    @filecount = UploadFile.all.count
  end
end

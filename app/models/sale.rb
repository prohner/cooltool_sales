class Sale < ActiveRecord::Base
  belongs_to :country
  belongs_to :app_version
  belongs_to :upload_file
end

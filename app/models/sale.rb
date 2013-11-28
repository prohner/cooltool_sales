class Sale < ActiveRecord::Base
  belongs_to :country
  belongs_to :app_version
end

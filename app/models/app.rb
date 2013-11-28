class App < ActiveRecord::Base
  has_many :app_versions, dependent: :destroy
end

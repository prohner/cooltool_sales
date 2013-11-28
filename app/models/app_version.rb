class AppVersion < ActiveRecord::Base
  belongs_to :app
  has_many :sales, dependent: :destroy
end

class UploadFile < ActiveRecord::Base
  has_many :sale, dependent: :destroy
end

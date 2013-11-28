class AddAppRefToAppVersions < ActiveRecord::Migration
  def change
    add_reference :app_versions, :app, index: true
  end
end

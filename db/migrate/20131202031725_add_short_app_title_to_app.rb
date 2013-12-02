class AddShortAppTitleToApp < ActiveRecord::Migration
  def change
    add_column :apps, :short_app_name, :string
  end
end

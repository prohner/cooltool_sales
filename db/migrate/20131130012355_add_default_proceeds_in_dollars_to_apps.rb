class AddDefaultProceedsInDollarsToApps < ActiveRecord::Migration
  def change
    add_column :apps, :default_proceeds_in_dollars, :float
  end
end

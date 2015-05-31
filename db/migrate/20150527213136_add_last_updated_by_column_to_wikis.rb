class AddLastUpdatedByColumnToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :updated_by, :integer
  end
end

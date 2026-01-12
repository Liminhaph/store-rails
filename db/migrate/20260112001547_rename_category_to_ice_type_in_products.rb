class RenameCategoryToIceTypeInProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :category, :ice_type
  end
end

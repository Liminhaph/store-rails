class ChangeIceTypeToIntegerInProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :ice_type, :string
    add_column :products, :ice_type, :integer, default: 0, null: false
  end
end

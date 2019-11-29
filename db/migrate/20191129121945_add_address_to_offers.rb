class AddAddressToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :address, :string
  end
end

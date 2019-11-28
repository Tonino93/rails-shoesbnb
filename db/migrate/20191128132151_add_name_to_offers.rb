class AddNameToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :name, :string
  end
end

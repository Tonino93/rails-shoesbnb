class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :brand
      t.string :description
      t.string :category
      t.string :size
      t.string :color
      t.float :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

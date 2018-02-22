class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name, null:false
      t.string :property_type
      t.string :address
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country
      t.integer :room_number
      t.integer :bed_number
      t.integer :guest_number
      t.integer :price
      t.text :amenities, array:true, default:[]
      t.text :tags, array:true, default:[]


      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.2]
    def change 
        create_table :events do |t|
            t.string :name
            t.integer :category_id
            t.text :description
            t.integer :price
            t.string :address
            t.timestamps
        end 

    end 
    []
end 
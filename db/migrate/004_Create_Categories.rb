class CreateCategories < ActiveRecord::Migration[5.2]
    def change 
        create_table :categories do |t|
            t.string :name
            t.timestamps
        end 
<<<<<<< HEAD
    end 
=======
    end
>>>>>>> f9733cf2830a8f4ee4a5b4b363dc87187d9f0e18
end 
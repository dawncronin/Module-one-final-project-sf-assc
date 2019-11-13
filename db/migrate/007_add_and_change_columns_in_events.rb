class AddAndChangeColumnsInEvents < ActiveRecord::Migration[5.2]
    def change 
        add_column :events, :start_date, :string
        add_column :events, :end_date, :string
        add_column :events, :is_free, :boolean
        add_column :events, :url, :string
        remove_column :events, :price
        remove_column :events, :address
    end 
    []
end 
class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :genre 
      t.string :artist_name 
      t.string :album_name 
      t.integer :user_id 
    end 
      end
end

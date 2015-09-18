class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :user_id
      t.integer :category
      t.string  :urlTitle
      t.string  :urlLink
      t.text    :memo
      t.string  :tagFirst, array: true, default: [] 
      t.integer :star
      t.timestamps null: false
    end
  end
end

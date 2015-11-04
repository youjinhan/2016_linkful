class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userId
      t.string :userName
      t.string :userPw
      t.timestamps null: false
    end
  end
end

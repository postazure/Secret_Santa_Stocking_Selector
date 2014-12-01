class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :spouse
      t.string :email
      t.integer :group_id

      t.timestamps
    end
  end
end

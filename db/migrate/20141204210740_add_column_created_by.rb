class AddColumnCreatedBy < ActiveRecord::Migration
  def change
    add_column :friends, :created_by, :integer, null:false
    add_column :groups, :created_by, :integer, null:false
  end
end

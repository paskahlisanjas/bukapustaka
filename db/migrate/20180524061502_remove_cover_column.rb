class RemoveCoverColumn < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :books, :cover    
  end

  def self.down
    add_column :books, :cover
  end
end

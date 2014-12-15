class CreateShells < ActiveRecord::Migration
  def self.up
    create_table :shells do |t|
      t.string  :file_path
      t.string   :content 
      t.string   :whodunnit
      t.boolean :result
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :shells
  end
end

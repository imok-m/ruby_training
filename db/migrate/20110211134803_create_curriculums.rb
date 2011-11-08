class CreateCurriculums < ActiveRecord::Migration
  def self.up
    create_table :curriculums do |t|
      t.string :name
      t.string :description
      t.integer :sort_order
      t.string :textbook_file_name
      t.string :textbook_content_type
      t.integer :textbook_file_size
      t.datetime :textbook_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculums
  end
end

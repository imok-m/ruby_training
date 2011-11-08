class CreateExamQuestions < ActiveRecord::Migration
  def self.up
    create_table :exam_questions do |t|
      t.references :curriculum
      t.integer :number
      t.text :title
      t.text :question
      t.text :answer
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :exam_questions
  end
end

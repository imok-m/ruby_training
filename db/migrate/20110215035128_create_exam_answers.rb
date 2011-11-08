class CreateExamAnswers < ActiveRecord::Migration
  def self.up
    create_table :exam_answers do |t|
      t.references :user
      t.references :exam_question
      t.text :answer
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :exam_answers
  end
end

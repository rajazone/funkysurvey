class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :questiontxt
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end

class CreateMultipleChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_choices do |t|
      t.string :ans1
      t.string :ans2
      t.string :ans3
      t.string :ans4
      t.string :correct_ans
      t.references :question, null: false, foreign_key: true
      t.timestamps
    end
  end
end

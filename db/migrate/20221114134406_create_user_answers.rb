class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :paper_id
      t.boolean :is_correct, default: false
      t.timestamps
    end
  end
end

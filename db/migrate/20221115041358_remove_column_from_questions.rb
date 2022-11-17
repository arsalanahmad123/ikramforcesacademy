class RemoveColumnFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :multiple_choices, :correct_ans, :string 
    add_column :questions, :correct_ans, :string 
  end
end

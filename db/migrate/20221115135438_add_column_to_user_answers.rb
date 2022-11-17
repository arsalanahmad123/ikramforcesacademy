class AddColumnToUserAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :user_answers, :selected_answer, :string
  end
end

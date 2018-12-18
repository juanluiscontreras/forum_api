class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :content
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

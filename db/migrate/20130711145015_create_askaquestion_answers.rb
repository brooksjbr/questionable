class CreateAskaquestionAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, :null => false
      t.text :content, :null => false
      t.string :unique_id, :null => false
      t.integer :user_id, :null => false
      t.string :buddy_image_url
      t.string :alias
      t.integer :votes_count

      t.timestamps
    end
    
    add_index :answers, :question_id
    add_index :answers, :user_id
    add_index :answers, :unique_id
  end
end

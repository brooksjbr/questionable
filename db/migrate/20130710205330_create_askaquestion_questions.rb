class CreateAskaquestionQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :unique_id, :null => false
      t.integer :user_id, :null => false
      t.string :buddy_image_url
      t.string :alias
      t.integer :answers_count, default: 0 
      t.integer :votes_count, default: 0

      t.timestamps
    end
    
    add_index :questions, :unique_id
    add_index :questions, :user_id
  end
end

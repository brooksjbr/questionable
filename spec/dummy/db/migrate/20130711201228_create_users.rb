class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :alias
      t.string :buddy_image_url

      t.timestamps
    end
    
    execute('insert into users (alias, buddy_image_url) values ("testuser1", "http://cdn.test.com/buddy_icon.jpg")')
    execute('insert into users (alias, buddy_image_url) values ("testuser2", "http://cdn.test.com/buddy_icon.jpg")')
    execute('insert into users (alias, buddy_image_url) values ("testuser3", "http://cdn.test.com/buddy_icon.jpg")')
  end
end

class Question < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
  		t.text :content
  		t.integer :response_id
  		t.integer :asker_id
  		t.string  :asker
  		t.string  :status, :default => "open"
    end
  end

  def down
    drop_table :questions
  end
end

class Responses < ActiveRecord::Migration
  def up
  	create_table :responses do |t|
  		t.string :rating
  		t.integer :question_id
  		t.integer :responder_id
  		t.string  :approval_status
  	end
  end

  def down
    drop_table :responses
  end
end

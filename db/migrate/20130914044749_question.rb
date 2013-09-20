class Question < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
  		t.text    :description
      t.string  :title
  		t.integer :response_id
      t.string  :hit_id
      t.string  :video_url
  		t.string  :status, :default => "open"
    end
  end

  def down
    drop_table :questions
  end
end

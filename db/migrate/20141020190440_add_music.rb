class AddMusic < ActiveRecord::Migration
  def change
  	create_table :musics do |t|
  		t.string :song_title
  		t.string :author
  		t.string :url
  		# t.integer :upvotes
  		t.timestamps
  	end
  end
end

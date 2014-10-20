class Music < ActiveRecord::Base
	validates :song_title, :author, :url, presence: :true
end

class Record < ActiveRecord::Base 
    belongs_to :user 
    validates :genre, :artist_name, :album_name, presence: true 
end 
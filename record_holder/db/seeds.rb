oscar@mail.com = User.create(email: "oscar@mai;.com")
college_dropout = Album.new(genre: "Hip-Hop", artist_name: "Kanye West", album_name: "College Dropout")
college_dropout.user = oscar@mail.com
college_dropout.save 

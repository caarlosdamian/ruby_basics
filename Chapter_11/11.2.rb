def shuffle arr
	shuf = []

	while arr.length > 0
		rand_index = rand(arr.length)
		curr_index = 0
		new_arr = []

		arr.each do |item|
			if curr_index == rand_index
				shuf.push item
			else
				new_arr.push item
			end
			curr_index = curr_index + 1
		end
		arr = new_arr
	end
	shuf
end

song_name = Dir['C:/Users/Eduardo/Music/**/*.m4p']

puts 'What would you like to call your playlist?'
playlist_name = gets.chomp

song_list = []
song_name.each do |name|
	song_list.push name
end

filename = playlist_name+'.m3u'
shuffle_arr = shuffle song_list

temp_song_list = ""
shuffle_arr.each do |song|
	temp_song_list = temp_song_list + song + "\n"
end

File.open filename, 'w' do |f|
	f.write temp_song_list
end

puts
puts 'Done!'
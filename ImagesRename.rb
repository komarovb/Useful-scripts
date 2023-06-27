def main
  puts "Welcome!"
  if ARGV.count >2
  	puts "Max 2 arguments are allowed!"
  else
		if ARGV.count == 0
			puts "Type in folder to rename files in it!"
			fold = gets.chomp
		else
			fold = ARGV[0]
		end
		files = Dir["#{fold}/*.jpg"]
		i = 1
		if ARGV.count == 2
			fold2 = ARGV[1]
			unless File.directory?(fold2)
				puts "Creating '#{fold2}' directory to store files!"
				Dir.mkdir(fold2)
			else
				puts "Directory '#{fold2}' already exists"
			end
		else
			fold2 = "output"
			unless File.directory?("output")
				puts "Creating 'output' directory to store files!"
				Dir.mkdir("output")
			else
				puts "Directory 'output' already exists"
			end
		end
		files.each do |file|
			File.open(file, 'rb') do |f|
				File.open("#{fold2}/#{i}.jpg", 'wb') {|out| out.write(f.read) }
			end
			i=i+1
		end
		puts "You can find your images in the #{fold2} folder"
	end
end

main
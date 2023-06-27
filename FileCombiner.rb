OUT_FILE_NAME = "ResultFile.txt"

def main
  comments=false

  puts "Enter number of files to combine:(0 or wrong input stops the script)"
  n=gets.chomp.to_i
  puts "Enter 1 to turn on comments"
  c=gets.chomp.to_i
  if n==0 || c==0
    puts "Wrong input!"
    puts "Bye bye..."
    return
  end
  if c == 1
    comments = true
  end

  out = File.open(OUT_FILE_NAME, "w")
  for i in 1..n
    puts "Type in name of a file number #{i}"
    f_name = gets.chomp
    unless File.exist?(f_name)
      puts "No file with such name!"
      puts "Bye bye..."
      if i > 1
        puts "Partial solution you can find in ResultFile"
      end
      out.close
      return
    end
    f = File.open(f_name)
    f.each_line do |line|
      out.print line
    end
    f.close
    if comments == true
      out.print "\nEnd of file #{i}"
      40.times{ out.print "--" }
      out.print "\n"
    else
      out.print "\n"
    end
  end
  puts "Your Result File: #{OUT_FILE_NAME} was successfully created!"
  out.close
end

main
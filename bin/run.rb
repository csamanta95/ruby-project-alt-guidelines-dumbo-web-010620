require_relative '../config/environment'

# puts "Hello student!"

def greeting 
    puts "Hello student!"
    puts "Please type 'N' for new student, or 'R', for returning"
    input = gets.chomp
end 

def returning 
    puts "Would you like to see your courses?"
end 


greeting
returning
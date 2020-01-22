require_relative '../config/environment'

# puts "Hello student!"

cli = Interface.new
student_instance = cli.welcome
# binding.pry 
while !student_instance
    system "clear"
    puts "Nice"
    cli.welcome
end 

cli.students = student_instance
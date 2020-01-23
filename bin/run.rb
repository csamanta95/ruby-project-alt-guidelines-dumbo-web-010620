require_relative '../config/environment'

# puts "Hello student!"

cli = Interface.new
cli.run
# binding.pry 
# if !student_object
#     system "clear"
#     puts "Nice"
#     # binding.pry
#     student_object = cli.welcome
# end 

cli.students = student_object



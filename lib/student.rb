class Student < ActiveRecord::Base
    has_many :enrollments
    has_many :courses, through: :enrollments

    # attr_accessor :name


    def self.new_student 
        puts "Please enter your name."
        name = gets.chomp 
        puts "Welcome, #{name}"
        Student.create(name: name)
        # puts "Welcome, #{self.name}"
        


    end 

    def self.returning_student 
        puts "Welcome back, please enter your name."
        returning = gets.chomp
        Student.find_by("name LIKE?", "%#{returning}%")
        # Student.find_by(name: returning)
        puts "Welcome back #{self}"
        # Student.find_by("name LIKE?", "%#{returning_student}%")
        
    end

#     def enrollment_list
#         puts Enrollment.all.map do |student|
#             student.name
#         end

#         def courses_list
#             puts Course.all.map do |student|
#                 student.name
#             end

#         def delete_student_enrollment
#             array= Enrollment.find_by(name:input)
#             array.delete
#         end

#         def change_student_enrollment    
#         array1= Enrollment.find_by(name: input)
#         input2 = prompt.ask('What is your course?', required: true)
#         array1.update(course_id: input2)
#         array1.save
#         end
# end


end
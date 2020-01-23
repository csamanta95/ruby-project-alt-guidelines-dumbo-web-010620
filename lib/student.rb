class Student < ActiveRecord::Base
    has_many :enrollments
    has_many :courses, through: :enrollments
end

#     # attr_accessor :name


#     def self.new_student 
#         puts "Please enter your name."
#         name = gets.chomp 
#         puts "Welcome, #{name}"
#         Student.create(name: name)
#         # puts "Welcome, #{self.name}"
        


#     end 

#     def self.returning_student 
#         puts "Welcome back, please enter your name."
#         returning = gets.chomp
#         Student.find_by("name LIKE?", "%#{returning}%")
#         # Student.find_by(name: returning)
#         puts "Welcome back #{self.name}"
#         # Student.find_by("name LIKE?", "%#{returning_student}%")
        
#     end

    def list_courses
        Course.all.map {|i|i.subject}
        # course_names = Course.pluck(:subject)
        # course_names.each do |subject|
        #     puts subject
        # end
    end

# #     def enrollment_list
# #         puts Enrollment.all.map do |student|
# #             student.name
# #         end

# #         

#         def delete_student_enrollment
#             # array= Enrollment.find_by(name: input1) 
#             # array.delete
#         end

# #         def change_student_enrollment    
# #         array1= Enrollment.find_by(name: input)
# #         input2 = prompt.ask('What is your course?', required: true)
# #         array1.update(course_id: input2)
# #         array1.save
# #         end
# # end


# end
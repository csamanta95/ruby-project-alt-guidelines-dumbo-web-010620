class Interface 

    attr_accessor :prompt, :students

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
    
        get_name
        welcome
        main_menu 
    
    end

    def welcome
        puts "Welcome to the Enrollment App."
        prompt.select("Are you a returning student, or new student?") do |menu|
            menu.choice "New Student", -> {new_student}
            menu.choice "Returning Student", -> {returning_student}
        end 
    end 

    def main_menu 
        system "clear"
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Enroll into a course", -> {create}
            menu.choice "See all your courses", -> {check_course}
            menu.choice "See all available courses", -> {list_courses}
            menu.choice "Update your enrollment", -> {update}
            menu.choice "Remove yourself from a course", -> {delete}
            menu.choice "exit"
        end 
    end
    
   
  
   
    # def enroll 
    #     puts "What is your name?"
    #     name = gets.chomp
    #     @name = Student.create(name: name)

    #   end

    def get_name
        puts "Please type in your name"
        @name = gets.chomp.downcase.capitalize
    end
    def user_valid
        if Student.find_by(name: @name)
            true 
        else
            false
        end
    end

    def new_student
        @student = Student.create(name: @name)
    end

    def returning_student
        @student = Student.find_by(name: @name)
    end

    def list
        Course.all.map do |i|
            puts "#{i.id}"
            puts "#{i.description}"
            puts "#{i.subject}"
        end
    end

    def create
        puts list
        puts "Please enter the ID of the course you want to enroll in."
        answer = gets.chomp
        Enrollment.create(student: @student, course: Course.find(answer), available_courses: nil, time_slots: nil)
        puts "Enrollment completed"
        main_menu
    end
    

    def check_course
        array = Enrollment.select {|i|i.student_id == @student.id}
        new = array.map do |i|
            i.course
        end
        newer = new.map do |i|
        puts "----------------------------------------------------"
        puts "ID: #{i.id}"
        puts "Description: #{i.description}"
        puts "Subject: #{i.subject}"
        puts "----------------------------------------------------"
        end
    end

    def list_courses
        Course.all.map {|i| 
        puts "*****************************"
        puts i.subject}
        puts "*****************************"
        # course_names = Course.pluck(:subject)
        # course_names.each do |subject|
        #     puts subject
        # end
    end

    def update 
        puts check_course
        puts "Please enter the ID of the course you want to update"
        answer = gets.chomp
        puts "Please enter the subject you want to change to"
        subject = gets.chomp.capitalize
        @student.courses.find_by(answer).update(subject: subject)
        puts "Course have been updated"
        main_menu
    end

    def delete
        puts check_course
        puts "Please enter the ID of the course you want to delete"
        answer = gets.chomp
        @student.courses.destroy(answer)
        puts "Course have been deleted"
        main_menu
    end


    #   def delete 
    #     input = prompt.ask('What is your course?', required: true)
    #     Student.delete_student_enrollment
    # end

    # def change 
    #     input = prompt.ask('What is your name?', required: true)
    #     Student.change_student_enrollment
    # end
end


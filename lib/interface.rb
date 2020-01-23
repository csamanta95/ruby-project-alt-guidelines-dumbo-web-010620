class Interface 

    attr_accessor :prompt, :students

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
        welcome
        main_menu 
    end

    def welcome
        puts "Welcome to the Enrollment App."
        answer = prompt.select("Are you a returning student, or new student?") do |menu|
            menu.choice "New Student", -> {Student.new_student}
            menu.choice "Returning Student", -> {Student.returning_student}
    
        end 
    end 

    def main_menu 
        system "clear"
        prompt.select("What would you like to do?") do |menu|
            menu.choice "See all your courses", -> {self.student.list_courses}
            menu.choice "See all available courses", -> {self.student}
            menu.choice "Remove yourself from a course"
        end 
    end 

    # def enroll 
    #     puts "What is your name?"
    #     name = gets.chomp
    #     @name = Student.create(name: name)

    #   end
    #   def user_valid
    #     if Student.find_by(name: name)
    #         true 
    #     else
    #         false
    #   end
    # end

    #   def delete 
    #     input = prompt.ask('What is your name?', required: true)
    #     Student.delete_student_enrollment
    # end

    # def change 
    #     input = prompt.ask('What is your name?', required: true)
    #     Student.change_student_enrollment
    # end

end

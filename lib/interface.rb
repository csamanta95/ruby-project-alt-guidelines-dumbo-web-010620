class Interface 

    attr_accessor :prompt, :students

    def initialize
        @prompt = TTY::Prompt.new
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
        prompt.select("Welcome #{self.student.name}. What would you like to do?") do |choices|
            menu.choice "See all your courses", -> {self.student.list_courses}
            menu.choice "See all available courses", -> {self.student}
            menu.choice "Remove yourself from a course"
        end 
    end 
end

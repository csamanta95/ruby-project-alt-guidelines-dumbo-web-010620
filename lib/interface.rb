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
end

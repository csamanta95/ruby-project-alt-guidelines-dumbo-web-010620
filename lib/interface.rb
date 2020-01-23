class Interface 

    # attr_accessor :prompt, :students

    def run
        welcome
        login_menu
        main_menu
    end

    def welcome
        puts "Welcome to the Enrollment App."
        sleep(2)
    end     

    def login_menu
        puts "Please enter your name to begin"
        @name_input = gets.chomp 
        @student = Student.find_by("name LIKE?", "%#{@name_input}%")

        if @student 
            puts "Welcome back, #{@name_input}"
            sleep(2)
            system "clear"
        elsif 
            puts "Welcome to the Enrollment App #{@name_input}"
            sleep(2)
            Student.create(name: @name_input)
        end 
    end 

    def main_menu 
        puts "\nWhat would you like to do?
            1. Check your courses.
            2. Check all available courses for enrollment.
            3. Remove yourself from a course."

            choice_input = gets.chomp
            choice_option = [1,2,3]

            if choice_input.to_i == choice_option[0]
                puts "Here are all of your courses you're enrolled in"
            elsif choice_input.to_i == choice_option[1]
                puts "oks"
            elsif choice_input.to_i == choice_option[2]
                puts "okbro"
            else 
                puts main_menu
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

class Interface 

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
            system"clear"
            puts "Welcome back, #{@name_input.capitalize}"
            sleep(2)
        else
            puts "Welcome to the Enrollment App, #{@name_input.capitalize}"
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
                 if Enrollment.find_by(student_id: @student)  
                    puts "Here are all your courses you're enrolled in"
                        system "clear"
                        enrolled_student
                        main_menu
                 else
                    puts "You're not enrolled in any course."
                    main_menu
                 end

            elsif choice_input.to_i == choice_option[1]
                puts "Here are all available courses for enrollment"

            elsif choice_input.to_i == choice_option[2]
                puts "Which course would you like to remove yourself from?"

            else 
                system "clear"
                puts "Sorry I didn't get that."
                main_menu
            end 
    end 

    def enrolled_student
        student_enrollment = Enrollment.where(student_id: @student)
        student_enrollment.map {|course_instance| course_instance.course}
    end 
end

class Interface 

    def run
        ascii
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
            @student = Student.find_by("name LIKE?", "%#{@name_input}%")
        end 
    end 

    def main_menu 
        puts "\nWhat would you like to do?
            1. Check your courses
            2. Check all available courses for enrollment
            3. Remove yourself from a course
            4. Update your courses
            5. Exit"

            choice_input = gets.chomp
            choice_option = [1,2,3,4,5]

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
                puts "Here are all available courses for enrollment."
                sleep(2)
                list_all_courses
                puts "Which course would you like to enroll in?"
                create_enrollment

            elsif choice_input.to_i == choice_option[2]
                puts "Which course would you like to remove yourself from?"
                delete_enrollment

            elsif choice_input.to_i == choice_option[3]
                update_courses


            elsif choice_input.to_i == choice_option[4]
                system "clear"
                puts "Exiting."
                sleep(2)
                exit 

            else 
                system "clear"
                puts "Sorry I didn't get that."
                main_menu
            end 
    end 

    def list_all_courses 
      Course.all.map do |course_instance|
        puts "---------------------------------------------------"
        puts "Course ID: #{course_instance.id}."
        puts "Course description: #{course_instance.description}"
        puts "Course subject: #{course_instance.subject}"
        puts "---------------------------------------------------"
      end 
    end 

    def create_enrollment
        puts "Please enter the ID of the course you want to enroll in."
        answer = gets.chomp
        Enrollment.create(student: Student.find(@student.id), course: Course.find(answer))
        puts "Enrollment completed"
        main_menu
    end

    def enrolled_student
        courses = Enrollment.select {|enrollment_instance| enrollment_instance.student_id == @student.id}
        all_courses = courses.map  {|course_instance| course_instance.course}
        newer = all_courses.map {|course_ins|
        puts "----------------------------------------------------"
        puts "ID: #{course_ins.id}"
        puts "Description: #{course_ins.description}"
        puts "Subject: #{course_ins.subject}"
        puts "----------------------------------------------------"}
    end

    def delete_enrollment
        puts enrolled_student
        puts "Please enter the ID of the course you want to delete"
        answer = gets.chomp
        @student.courses.destroy(answer)
        puts "You have sucessfully been removed from the course."
        main_menu
    end

    def update_courses
        puts enrolled_student
        puts "Please enter the ID of the course you want to update"
        enrolled_student
        answer = gets.chomp
        puts "Please enter the subject you want to change to"
        subject = gets.chomp.capitalize
        @student.courses.find_by(answer).update(subject: subject)
        puts "Course has been updated"
        main_menu
    end

    def ascii 
        puts "
        ######## ##    ## ########   #######  ##       ##       ##     ## ######## ##    ## ########       ###    ########  ########  
        ##       ###   ## ##     ## ##     ## ##       ##       ###   ### ##       ###   ##    ##         ## ##   ##     ## ##     ## 
        ##       ####  ## ##     ## ##     ## ##       ##       #### #### ##       ####  ##    ##        ##   ##  ##     ## ##     ## 
        ######   ## ## ## ########  ##     ## ##       ##       ## ### ## ######   ## ## ##    ##       ##     ## ########  ########  
        ##       ##  #### ##   ##   ##     ## ##       ##       ##     ## ##       ##  ####    ##       ######### ##        ##        
        ##       ##   ### ##    ##  ##     ## ##       ##       ##     ## ##       ##   ###    ##       ##     ## ##        ##        
        ######## ##    ## ##     ##  #######  ######## ######## ##     ## ######## ##    ##    ##       ##     ## ##        ##        "    
                                                                                                                                                
    end 
end

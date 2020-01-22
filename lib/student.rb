class Student < ActiveRecord::Base
    has_many :enrollments
    has_many :courses, through: :enrollments

    attr_accessor :name


    def self.new_student 
        puts "Please enter your name."
        student = gets.chomp 
        Student.create(name: student)
        puts "Welcome, #{student}"
    end 

    def self.returning_student 
        puts "Welcome back, please enter your name."
        returning = gets.chomp
        Student.find_by("name LIKE?", "%#{returning}%")
        # Student.find_by(name: returning)
        puts "Welcome back #{self.name}"
        # Student.find_by("name LIKE?", "%#{returning_student}%")
    end




end
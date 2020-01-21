Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
puts "Deleting old seeds"


5.times do 
    Student.create(name: Faker::Name.name) 
end 
puts "Added students"

c1 = Course.create(subject: "Biology", description: "Monday - Wednesday, 09:00 - 11:00 AM", timeslot: 9)

puts "Added courses"
Enrollment.create(student_id: Student.all.sample.id, course_id: c1.id, available_courses: "Biology", time_slots: 9.30)
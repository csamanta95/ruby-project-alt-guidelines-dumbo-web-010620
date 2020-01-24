Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
puts "Deleting old seeds"


8.times do 
    Student.create(name: Faker::Name.name) 
end 
puts "Added students"

Course.create(subject: "Biology", description: "Monday - Wednesday, 09:00 - 11:00 AM")
Course.create(subject: "Calculus", description: "Monday - Wednesday, 09:00 - 11:00 AM")
Course.create(subject: "Software Engineering", description: "Monday - Wednesday, 09:00 - 11:00 AM")
Course.create(subject: "Astronomy", description: "Monday - Wednesday, 09:00 - 11:00 AM")
Course.create(subject: "English", description: "Monday - Wednesday, 09:00 - 11:00 AM")

puts "Added courses"
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
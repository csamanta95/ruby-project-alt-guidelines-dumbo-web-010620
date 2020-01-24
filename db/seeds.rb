Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
puts "Deleting old seeds"


8.times do 
    Student.create(name: Faker::Name.name) 
end 
puts "Added students"

Course.create(subject: "Biology", description: "Monday - Wednesday, 09:00 - 11:00 ")
Course.create(subject: "Calculus", description: "Tuesday - Wednesday, 12:00 - 14:00 ")
Course.create(subject: "Software Engineering", description: "Wednesday - Friday, 08:00 - 10:00")
Course.create(subject: "Astronomy", description: "Monday - Friday, 14:00 - 15:00 ")
Course.create(subject: "English", description: "Monday - Wednesday, 15:00 - 17:00")

puts "Added courses"
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
Enrollment.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id)
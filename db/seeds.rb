Student.destroy_all
Course.destroy_all
Enrollment.destroy_all
puts "Deleting old seeds"


# 5.times do 
#     Student.create(name: Faker::Name.name) 
# end 
s1 = Student.create(name: "Rebecca")
s2 = Student.create(name: "Alison")
s3 = Student.create(name: "Paul")
s4 = Student.create(name: "David")
s5 = Student.create(name: "Tia")
puts "Added students"

c1 = Course.create(subject: "Biology", description: "Monday - Wednesday, 09:00 - 11:00 AM", timeslot: 9)
c2 = Course.create(subject: "Chemistry", description: "Monday - Wednesday, 09:00 - 12:00 AM", timeslot: 9)
c3 = Course.create(subject: "Computer Science", description: "Wednesday - Friday, 10:00 - 11:00 AM", timeslot: 10)
c4 = Course.create(subject: "Biology", description: "Monday - Wednesday, 12:00 - 1:30 PM", timeslot: 12)
c5 = Course.create(subject: "Earth Science", description: "Monday - Wednesday, 01:00 - 3:00 PM", timeslot: 1)

puts "Added courses"
e1 = Enrollment.create(student: s1, course: c1, available_courses: "Biology, Computer Science", time_slots: 9)
e2 = Enrollment.create(student: s2, course: c2, available_courses: "Biology, Chemistry", time_slots: 9)
e3 = Enrollment.create(student: s3, course: c3, available_courses: "Biology, Earth Science", time_slots: 9)
e4 = Enrollment.create(student: s4, course: c4, available_courses: "Biology", time_slots: 9)
e5 = Enrollment.create(student: s1, course: c5, available_courses: "Biology", time_slots: 9)
e6 = Enrollment.create(student: s5, course: c1, available_courses: "Biology", time_slots: 9)

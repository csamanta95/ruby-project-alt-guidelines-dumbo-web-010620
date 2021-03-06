class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change

    create_table :enrollments do |t|
      t.string   :student_id
      t.integer  :course_id
      t.string   :available_courses
      t.float    :time_slots

      t.timestamps
    end
  end
end

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string   :description
      t.float    :timeslot
      t.string   :subject

      t.timestamps
    end
  end
end

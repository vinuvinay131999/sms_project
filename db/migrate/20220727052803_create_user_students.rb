class CreateUserStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_students do |t|
      t.integer :user_id
      t.integer :student_id
    end
  end
end

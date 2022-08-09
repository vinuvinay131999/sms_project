class AddColumnsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column(:students , 'first_name', :string)
    add_column(:students , 'last_name', :string)
    add_column(:students , 'father_name', :string)
    add_column(:students , 'mother_name', :string)

    add_column(:students , 'date_of_birth', :date)
    add_column(:students , 'blood_group', :string)
    add_column(:students , 'standard', :string)
    add_column(:students , 'contact_number', :string)


  end
end

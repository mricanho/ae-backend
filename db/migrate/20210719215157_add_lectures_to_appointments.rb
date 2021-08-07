class AddLecturesToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :lecture, null: false, foreign_key: true
  end
end

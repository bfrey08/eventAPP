class CreateAttendeeResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :attendee_responses do |t|
      t.string :selected
      t.references :attendee, null: false, foreign_key: true
      t.references :response, null: false, foreign_key: true

      t.timestamps
    end
  end
end

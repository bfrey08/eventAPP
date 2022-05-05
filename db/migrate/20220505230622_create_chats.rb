class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :message
      t.references :room, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

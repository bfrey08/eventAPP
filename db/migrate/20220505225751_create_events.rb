class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :pic
      t.string :description
      t.string :location
      t.timestamp :start
      t.timestamp :end
      t.string :password_digest
      t.string :ban_brian

      t.timestamps
    end
  end
end

class CreateResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :text
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end

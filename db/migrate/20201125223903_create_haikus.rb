class CreateHaikus < ActiveRecord::Migration[6.0]
  def change
    create_table :haikus do |t|
      t.string :first
      t.string :second
      t.string :third
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

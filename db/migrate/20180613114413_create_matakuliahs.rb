class CreateMatakuliahs < ActiveRecord::Migration[5.1]
  def change
    create_table :matakuliahs do |t|
      t.string :nama
      t.string :semester
      t.string :description

      t.timestamps
    end
  end
end

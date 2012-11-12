class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end

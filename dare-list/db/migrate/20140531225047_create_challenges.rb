class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.boolean :type
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter_token
      t.string :ever_token
      t.string :email
      t.date :date

      t.timestamps
    end
  end
end

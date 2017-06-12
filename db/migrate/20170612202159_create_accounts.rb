class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :member_id
      t.string :first_name
      t.string :last_name
      t.integer :visit_count
      t.integer :loyalty_points
      t.integer :card_number
      t.datetime :join_date
      t.datetime :birthday
      t.datetime :last_visit
      t.timestamps
    end
  end
end

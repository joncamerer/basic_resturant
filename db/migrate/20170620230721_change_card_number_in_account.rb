class ChangeCardNumberInAccount < ActiveRecord::Migration[5.0]
  def self.up
    change_column :accounts, :card_number, :string
  end

  def self.down
    change_column :accounts, :card_number, :integer
  end
end

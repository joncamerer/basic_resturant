class ChangeCardNumberInMember < ActiveRecord::Migration[5.0]
  def self.up
    change_column :members, :card_number, :string
  end
 
  def self.down
    change_column :members, :card_number, :integer
  end
  
  
end

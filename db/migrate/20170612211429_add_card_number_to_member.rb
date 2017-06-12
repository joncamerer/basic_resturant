class AddCardNumberToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :card_number, :integer 
  end
end

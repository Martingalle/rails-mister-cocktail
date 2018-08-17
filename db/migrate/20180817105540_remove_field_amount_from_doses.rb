class RemoveFieldAmountFromDoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :doses, :amount, :Integer
  end
end

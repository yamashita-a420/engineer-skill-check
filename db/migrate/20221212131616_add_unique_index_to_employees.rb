class AddUniqueIndexToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_index :employees, :number, unique: true
    add_index :employees, :account, unique: true
  end
end

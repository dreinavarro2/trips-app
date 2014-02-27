class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :budget, precision: 10, scale: 2, default: 0.00
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end

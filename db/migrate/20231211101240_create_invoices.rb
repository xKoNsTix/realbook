class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_num
      t.decimal :price
      t.string :description
      t.string :customer_name

      t.timestamps
    end
  end
end

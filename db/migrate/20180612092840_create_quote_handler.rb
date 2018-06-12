class CreateQuoteHandler < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_handlers do |t|
			t.text :quote_ids
			t.timestamps
    end
  end
end

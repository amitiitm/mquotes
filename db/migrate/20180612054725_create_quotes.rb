class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :title
      t.boolean :published,  default: true

      t.timestamps
    end
  end
end

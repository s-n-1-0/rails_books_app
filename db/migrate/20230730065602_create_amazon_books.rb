class CreateAmazonBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :amazon_books, id: false do |t|
      t.string :asin, null: false, primary_key: true
      t.string :isbn13

      t.timestamps
    end
  end
end

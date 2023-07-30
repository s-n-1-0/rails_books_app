class CreateKindles < ActiveRecord::Migration[7.0]
  def change
    create_table :kindles, id:false do |t|
      t.string :kindle_asin, null: false, primary_key: true
      t.string :paper_asin

      t.timestamps
    end
  end
end

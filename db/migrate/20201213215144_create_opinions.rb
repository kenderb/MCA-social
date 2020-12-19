class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :author_id, null: false, foreign_key: true
      t.text :text
  
      t.timestamps
    end
  end
end

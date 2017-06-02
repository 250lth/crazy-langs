class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :cat_id
      t.string :cat_title
      t.integer :cat_pages
      t.integer :cat_subcats
      t.integer :cat_files

      t.timestamps
    end
  end
end

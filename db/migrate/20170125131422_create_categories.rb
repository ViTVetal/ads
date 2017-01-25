class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
	  t.string      :name_ru
	  t.string      :name_uk
      t.references  :parent
      t.timestamps
    end
  end
end

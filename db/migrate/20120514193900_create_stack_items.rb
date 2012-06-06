class CreateStackItems < ActiveRecord::Migration
  def change
    create_table :stack_items do |t|
      t.integer :id
      t.string :item_name

      t.timestamps
    end
  end
end

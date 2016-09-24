class CreateMutters < ActiveRecord::Migration
  def change
    create_table :mutters do |t|
      
      t.text :content

      t.timestamps null: false
    end
  end
end

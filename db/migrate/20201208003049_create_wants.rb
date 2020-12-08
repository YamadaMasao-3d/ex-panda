class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :name,      null: false
      t.text :content
      t.references :user,  null: false,  foreign_key: true

      t.timestamps
    end
  end
end

class CreateExpendables < ActiveRecord::Migration[6.0]
  def change
    create_table :expendables do |t|
      t.string :name,                null: false
      t.text :content,               null: false
      t.integer :period,             null: false
      t.datetime :registration_day,  null: false
      t.references :user,            null: false,  foreign_key: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :status, null: false, default: 'active'
      t.string :phone
      t.string :title

      t.timestamps
    end
  end
end

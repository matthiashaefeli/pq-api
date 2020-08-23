class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :admin_id
      t.boolean :public
      t.string :password

      t.timestamps
    end
  end
end

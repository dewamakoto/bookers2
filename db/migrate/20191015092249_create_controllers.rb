class CreateControllers < ActiveRecord::Migration[5.2]
  def change
    create_table :controllers do |t|
      t.string :home
      t.string :index
      t.string :about

      t.timestamps
    end
  end
end

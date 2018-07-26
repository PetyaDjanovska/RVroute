class CreateCampsites < ActiveRecord::Migration[5.2]
  def change
    create_table :campsites do |t|
      t.string :name
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end

class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :description

      t.timestamps
    end
  end
end

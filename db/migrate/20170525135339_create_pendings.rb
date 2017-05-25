class CreatePendings < ActiveRecord::Migration[5.0]
  def change
    create_table :pendings do |t|
      t.references :user, foreign_key: true
      t.references :inviter, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGroupDepenses < ActiveRecord::Migration[7.0]
  def change
    create_table :group_depenses do |t|
      t.references :group, foreign_key: true
      t.references :depense, foreign_key: true

      t.timestamps
    end
  end
end

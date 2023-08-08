class CreateJoinTableGroupDepense < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :depenses do |t|
      t.index [:group_id, :depense_id]
      t.index [:depense_id, :group_id]
    end
  end
end

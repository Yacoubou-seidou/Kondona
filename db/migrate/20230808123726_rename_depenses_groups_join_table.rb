class RenameDepensesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :depenses, table_name: :custom_join_table_name do |t|
      t.index [:group_id, :depense_id]
      t.index [:depense_id, :group_id]
    end
  end
end

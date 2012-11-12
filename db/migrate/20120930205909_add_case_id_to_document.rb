class AddCaseIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :case_id, :integer
    add_index :documents, :case_id
  end
end

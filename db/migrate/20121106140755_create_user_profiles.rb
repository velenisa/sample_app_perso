class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :profile_code
      t.string :profile_name
      t.boolean :profile_active
      t.boolean :profile_admin

      t.timestamps
    end
  end
end

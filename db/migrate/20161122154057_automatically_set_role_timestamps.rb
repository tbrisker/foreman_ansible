class AutomaticallySetRoleTimestamps < ActiveRecord::Migration
  def up
    change_column :ansible_roles, :created_at, :datetime, :null => true, :default => nil
    change_column :ansible_roles, :updated_at, :datetime, :null => true, :default => nil
  end

  def down
    change_column :ansible_roles, :created_at, :datetime, :null => false, :default => Time.now.utc
    change_column :ansible_roles, :updated_at, :datetime, :null => false, :default => Time.now.utc
  end
end

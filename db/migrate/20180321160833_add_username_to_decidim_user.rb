# frozen_string_literal: true

class AddUsernameToDecidimUser < ActiveRecord::Migration[5.1]
  def up
    raise "Decidim::User table does not exists" unless ActiveRecord::Base.connection.table_exists? "decidim_users"
    add_column :decidim_users, :username, :string unless column_exists?(:decidim_users, :username)
    add_column :decidim_users, :extra_attributes, :jsonb unless column_exists?(:decidim_users, :extra_attributes)
    add_index :decidim_users, :username unless index_exists?(:decidim_users, :username)
  end

  def down
    remove_index :decidim_users, :username if index_exists?(:decidim_users, :username)
    remove_column :decidim_users, :username if column_exists?(:decidim_users, :username)
    remove_column :decidim_users, :extra_attributes if column_exists?(:decidim_users, :extra_attributes)
  end
end

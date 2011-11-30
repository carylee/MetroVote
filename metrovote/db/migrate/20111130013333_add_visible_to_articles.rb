class AddVisibleToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :visible, :boolean
  end

  def self.down
    remove_column :articles, :visible
  end
end

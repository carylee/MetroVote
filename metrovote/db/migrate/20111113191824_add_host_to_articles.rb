class AddHostToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :host, :string
  end

  def self.down
    remove_column :articles, :host
  end
end

class RenameDescriptionMessagesColumn < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :messages, :description, :body
  end
end

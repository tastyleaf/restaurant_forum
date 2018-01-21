class RenameDescriptionColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column(:restaurants, :descrption, :description)
  end
end

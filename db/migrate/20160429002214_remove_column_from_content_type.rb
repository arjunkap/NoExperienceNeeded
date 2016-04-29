class RemoveColumnFromContentType < ActiveRecord::Migration
  def change
    remove_column :contents, :contrent_type_id
  end
end

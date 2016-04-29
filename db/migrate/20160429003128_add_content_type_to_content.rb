class AddContentTypeToContent < ActiveRecord::Migration
  def change
    add_reference :contents, :content_type, index: true, foreign_key: true
  end
end

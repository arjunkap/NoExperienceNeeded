class AddContentToContentRating < ActiveRecord::Migration
  def change
    add_reference :content_ratings, :content, index: true, foreign_key: true
  end
end

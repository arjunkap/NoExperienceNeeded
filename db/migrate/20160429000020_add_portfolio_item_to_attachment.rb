class AddPortfolioItemToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :portfolio_item, index: true, foreign_key: true
  end
end

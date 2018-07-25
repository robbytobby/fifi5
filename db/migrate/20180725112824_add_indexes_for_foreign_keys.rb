# frozen_string_literal: true

class AddIndexesForForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_index :linked_articles, %w[linked_article_id linked_article_type], name: 'index_linked_articles_on_article_id_and_type'
    add_index :payments, %w[link_id link_type]
  end
end

# frozen_string_literal: true

class AddIndexesForForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_index :addresses            , %w[user_id]                                 , unique: true
    add_index :articles             , %w[invoice_id]                              , unique: true
    add_index :audits               , %w[auditable_id auditable_type]             , unique: true
    add_index :audits               , %w[associated_id associated_type]           , unique: true
    add_index :audits               , %w[user_id user_type]                       , unique: true
    add_index :bike_parts           , %w[bike_id]                                 , unique: true
    add_index :bikes                , %w[address_id]                              , unique: true
    add_index :bikes_labels         , %w[bike_id]                                 , unique: true
    add_index :bikes_labels         , %w[label_id]                                , unique: true
    add_index :complaint_parcels    , %w[wholesaler_id]                           , unique: true
    add_index :complaints           , %w[address_id]                              , unique: true
    add_index :complaints           , %w[wholesaler_id]                           , unique: true
    add_index :complaints           , %w[complaint_parcel_id]                     , unique: true
    add_index :credits              , %w[address_id]                              , unique: true
    add_index :credits              , %w[complaint_id]                            , unique: true
    add_index :expenses             , %w[address_id]                              , unique: true
    add_index :invoices             , %w[address_id]                              , unique: true
    add_index :linked_articles      , %w[linked_article_id linked_article_type]   , unique: true, name: 'index_linked_articles_on_article_id_and_type'
    add_index :linked_articles      , %w[invoice_id]                              , unique: true
    add_index :order_articles       , %w[order_id]                                , unique: true
    add_index :orders               , %w[address_id]                              , unique: true
    add_index :payments             , %w[link_id link_type]                       , unique: true
    add_index :payments             , %w[address_id]                              , unique: true
    add_index :products             , %w[product_category_id]                     , unique: true
    add_index :staffs_team_meetings , %w[team_meeting_id]                         , unique: true
    add_index :tags_topics          , %w[tag_id]                                  , unique: true
    add_index :tags_topics          , %w[topic_id]                                , unique: true
    add_index :tasks                , %w[bike_id]                                 , unique: true
    add_index :topics               , %w[team_meeting_id]                         , unique: true
  end
end

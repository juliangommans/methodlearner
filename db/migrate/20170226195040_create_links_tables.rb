class CreateLinksTables < ActiveRecord::Migration
  def change
    create_table :links_tables do |t|
      t.string :site
      t.string :method_type
      t.string :language
      t.string :base_url
      t.string :url_prefix
      t.string :url_suffix
      t.boolean :viewed
      t.boolean :in_a_sentence
      t.string :sentence
      t.boolean :example
      t.timestamps null: false
    end
  end
end

class CreateTagsUrls < ActiveRecord::Migration
  def change
    create_table :tags_urls do |t|
        t.belongs_to :url
        t.belongs_to :tag
      t.timestamps null: false
    end
  end
end

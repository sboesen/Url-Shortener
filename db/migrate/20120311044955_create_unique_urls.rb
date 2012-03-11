class CreateUniqueUrls < ActiveRecord::Migration
  def change
    create_table :unique_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end

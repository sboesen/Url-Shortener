class CreateRedirections < ActiveRecord::Migration
  def change
    create_table :redirections do |t|
      t.string :url
      t.string :path
      t.timestamps
    end
  end
end

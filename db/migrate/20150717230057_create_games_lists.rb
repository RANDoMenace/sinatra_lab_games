class CreateGamesLists < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :title
      t.text :genre


      t.timestamps
    end
  end

end

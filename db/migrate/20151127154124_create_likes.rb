class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.belongs_to :chef, index: true
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end

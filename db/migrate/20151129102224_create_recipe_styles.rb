class CreateRecipeStyles < ActiveRecord::Migration
  def change
    create_table :recipe_styles do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :style, index: true

      t.timestamps
    end
  end
end

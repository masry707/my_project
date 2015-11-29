class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true

      t.timestamps
    end
  end
end

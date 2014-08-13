class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :review, index: true

      t.timestamps
    end
  end
end

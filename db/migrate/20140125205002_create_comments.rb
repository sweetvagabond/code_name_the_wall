class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :userable, polymorphic: true, index: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

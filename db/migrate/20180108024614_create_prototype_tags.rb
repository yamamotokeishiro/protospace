class CreatePrototypeTags < ActiveRecord::Migration
  def change
    create_table :prototype_tags do |t|
      t.integer :prototype_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :prototype_tags, :prototype_id
    add_index :prototype_tags, :tag_id
    add_index :prototype_tags, [:prototype_id,:tag_id],unique: true
  end
end

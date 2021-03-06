class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.integer "genre_id", null: false
    t.string "name", null: false
    t.text "image_id"
    t.text "introduction", null: false
    t.integer "price", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamps
    end
  end
end

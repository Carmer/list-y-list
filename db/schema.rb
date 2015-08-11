
ActiveRecord::Schema.define(version: 20150811151954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                      null: false
    t.boolean  "status",     default: false
    t.string   "notes"
    t.date     "due_date"
    t.date     "start_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end

class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name, null: false, uniqu: true
      t.string :title
      t.text   :description

      t.timestamps
    end
  end
end

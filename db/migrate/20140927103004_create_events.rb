class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string     :name
      t.belongs_to :event_type
      t.date       :due_date
      t.text       :description

      t.timestamps
    end
  end
end

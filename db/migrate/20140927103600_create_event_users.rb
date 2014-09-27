class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.belongs_to :event
      t.belongs_to :user

      t.timestamps
    end
  end
end

# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  event_type_id :integer
#  due_date      :date
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base
  belongs_to :event_type

  has_many :event_users
  has_many :users, through: :event_users
end
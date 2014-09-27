# == Schema Information
#
# Table name: event_types
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class EventType < ActiveRecord::Base
  has_many :events
end

# == Schema Information
#
# Table name: event_users
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class EventUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end

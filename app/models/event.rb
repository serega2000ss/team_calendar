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

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users


  def assign_users_by_ids(user_ids)
    user_ids.keys.each do |id|
      user = User.find_by_id(id)
      self.assign_user(user) if user
    end
    self.users.each do |user|
      unless user_ids.keys.include? user.id.to_s
        self.remove_user(user)
      end
    end
  end

  def assign_user(user)
    if EventUser.where(event_id: self.id, user_id: user.id).empty?
      EventUser.create!(event_id: self.id, user_id: user.id)
    end
  end

  def remove_user(user)
    link = EventUser.where(event_id: self.id, user_id: user.id).first
    link.destroy if link
  end

  def remove_all_users
    self.event_users.each do |event_user|
      event_user.destroy
    end
  end

  def has_user?(user)
    self.users.include?(user)
  end
end

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

  accepts_nested_attributes_for :event_users, allow_destroy: true

  validates :name, :due_date, presence: true
  validate do
    check_assigned_users
  end

  has_paper_trail class_name: 'Version', :ignore => [:id, :created_at, :updated_at]

  scope :ordered, -> { order(:due_date) }


  def title
    "#{self.event_type.title} - #{self.name}"
  end

  def shorten_description(words_number = 20)
    if self.description.split(" ").size <= words_number
      self.description
    else
      "#{self.description.split(" ").first(words_number).join(" ")}..."
    end
  end


  private

  def check_assigned_users
    if self.event_users.reject(&:marked_for_destruction?).count == 0
      errors.add(:base, "At least one user should be assigned")
    end
  end

end

# == Schema Information
#
# Table name: versions
#
#  id             :integer          not null, primary key
#  item_type      :string(255)      not null
#  item_id        :integer          not null
#  event          :string(255)      not null
#  whodunnit      :string(255)
#  object         :text
#  created_at     :datetime
#  object_changes :text
#

class Version < PaperTrail::Version
  belongs_to :user, foreign_key: 'whodunnit'
  belongs_to :calendar_event, class_name: 'Event', foreign_key: 'item_id'

  default_scope { order(created_at: :desc) }
end

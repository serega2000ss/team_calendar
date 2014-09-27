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

require 'rails_helper'

RSpec.describe EventType, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

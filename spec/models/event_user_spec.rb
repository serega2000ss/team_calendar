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

require 'rails_helper'

RSpec.describe EventUser, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
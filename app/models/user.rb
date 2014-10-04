# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  full_name              :string(255)
#  admin                  :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users

  has_many :editions, foreign_key: 'whodunnit', class_name: "Version"

  scope :ordered, -> { order(:full_name) }

  def event_sum(event)
    Version.where(whodunnit: self.id.to_s, item_id: event.id)
  end

end

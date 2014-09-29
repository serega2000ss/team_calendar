module FormHelper
  def setup_event(event)
    (User.all - event.users).each do |user|
      event.event_users.build(user: user)
    end

    event
  end
end
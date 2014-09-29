module FormHelper
  def setup_event(event)
    (User.all - (event.event_users).map{ |eu| eu.user}).each do |user|
      event.event_users.build(user: user)
    end

    event
  end
end
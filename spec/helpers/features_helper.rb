def sign_in_with(email, password)
  FactoryGirl.create(:user, email: email, password: password)

  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def sign_in_as_admin
  admin_user = FactoryGirl.create(:admin_user)

  visit new_user_session_path
  fill_in 'Email', with: admin_user.email
  fill_in 'Password', with: '1q2w3e4r'
  click_button 'Log in'
end

def init_event_types
  FactoryGirl.create(:event_type, name: 'meeting', title: 'Meeting')
  FactoryGirl.create(:event_type, name: 'out_of_office', title: 'Out of office')
  FactoryGirl.create(:event_type, name: 'conference', title: 'Conference')
  FactoryGirl.create(:event_type, name: 'project', title: 'Project')
  FactoryGirl.create(:event_type, name: 'task', title: 'Task')
end
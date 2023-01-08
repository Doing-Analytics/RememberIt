# frozen_string_literal: true

RSpec.describe 'project_box', type: :feature do
  background do
    let(:user) { create(:user) }
  end

  context 'after user register should redirection to project box page ' do
  end
  context 'user can click the plus button to create project ' do
    scenario 'will apear plus bottton ' do
      sign_in(user)
      visit '/'
      expect(page).to have_selector(:link_or_button, 'Add Project')
    end
  end
  context 'when user hover the project , will appear more botton ' do
  end

  context 'user can click more item after hover the project ' do
  end
end

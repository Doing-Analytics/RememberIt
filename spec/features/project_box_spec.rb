# frozen_string_literal: true

RSpec.describe 'project_box', type: :feature do
  background do
    let(:user) { create(:user) }
  end

  context 'after user register should redirection to project box page ' do
    scenario 'after register ,sucess register ' do
      visit root_path
      expect(page).to have_content '註冊'
      click_on '註冊'
      fill_in '名稱', with: 'Ning'
      fill_in '信箱', with: 'ning@gamil.com'
      fill_in '手機', with: '09123456789'
      fill_in '密碼', with: 'password'
      fill_in '確認密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '成功註冊'
      expect(page.current_path).to eq new_project_path
      expect { page }.to have_content 'template project '
    end
    scenario 'register failed' do
      visit root_path
      expect(page).to have_content '註冊'
      click_on '註冊'
      fill_in '名稱', with: 'Ning'
      fill_in '信箱', with: 'ning@gamil.com'
      fill_in '手機', with: '09123456789'
      fill_in '密碼', with: 'pas'
      fill_in '確認密碼', with: 'pas'
      click_on '送出'
      expect(page).to have_content '成功註冊'
      expect(page.current_path).not_to eq new_project_path
    end
  end
  context 'user can click the plus button to create project ' do
    before(:all) do
      sign_in(user)
    end
    scenario 'will apear plus bottton ' do
      visit '/'
      expect(page).to have_selector(:link_or_button, 'Add Project')
    end
  end
  context 'when user hover the project , will appear more botton ' do
    before(:all) do
      sign_in(user)
    end
    scenario 'hover the project' do
      visit '/'
      find('.project').hover have_content '...'
    end
  end

  context 'user can click more item after hover the project ' do
  end
end

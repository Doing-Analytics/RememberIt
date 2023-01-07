# frozen_string_literal: true

RSpec.describe 'user', type: :feature do

  context 'user login process' do
    let(:user) { create(:user) }

    scenario 'success' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '信箱', with: user.email
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入成功'
    end

    scenario 'fail' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入失敗'
    end

    scenario 'fail' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '信箱', with: user.email
      click_on '送出'
      expect(page).to have_content '登入失敗'
    end
  end
end
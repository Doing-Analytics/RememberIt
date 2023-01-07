# frozen_string_literal: true

RSpec.describe 'user', type: :feature do

  context 'user register process' do
    scenario 'success' do
      visit root_path
      expect(page).to have_content '註冊'
      click_on '註冊'
      fill_in '名稱', with: 'Ning'
      fill_in '信箱', with: 'ning@gamil.com'
      fill_in '手機', with: '09123456789'
      fill_in '密碼', with: 'password'
      fill_in '確認密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入'
    end

    scenario 'fail' do
      visit root_path
      expect(page).to have_content '註冊'
      click_on '註冊'
      fill_in '名稱', with: 'Ning'
      fill_in '手機', with: '09123456789'
      fill_in '密碼', with: 'password'
      fill_in '確認密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '請填入會員資訊'
    end

    scenario 'user did not confirm password' do
      visit root_path
      expect(page).to have_content '註冊'
      click_on '註冊'
      fill_in '名稱', with: 'Ning'
      fill_in '信箱', with: 'ning@gamil.com'
      fill_in '手機', with: '09123456789'
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '請填入會員資訊'
    end
  end
  
end
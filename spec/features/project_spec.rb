# frozen_string_literal: true

RSpec.describe 'project', type: :feature do
  let!(:team) { create(:team) }
  let!(:user) { create(:user)}
  let!(:team_member) { create(:team_member, :leader, user:, team:)}
  let!(:project){ create(:project, team:)}

  context 'success' do
    scenario 'member of team can create project' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '信箱', with: user.email
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入成功'
      click_on '查看我的團隊'
      expect(page).to have_content 'It\'s your teams!'
      first(:link, team.name).click
      expect(page).to have_content '新增專案'
      click_on '新增專案'
      fill_in '專案名稱', with: Faker::Kpop.girl_groups
      fill_in '關於你的專案', with: Faker::Marketing.buzzwords
      click_on '送出'
      expect(page).to have_content '專案建立成功'
    end

    scenario 'member of team can edit team\'s project' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '信箱', with: user.email
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入成功'
      click_on '查看我的團隊'
      expect(page).to have_content 'It\'s your teams!'
      first(:link, team.name).click
      first(:link, project.title).click
      click_on '編輯'
      fill_in '專案名稱', with: Faker::Kpop.girl_groups
      click_on '送出'
      expect(page).to have_content '專案編輯成功'
    end

    scenario 'leader of team can destroy team\'s project' do
      visit root_path
      expect(page).to have_content '登入'
      click_on '登入'
      fill_in '信箱', with: user.email
      fill_in '密碼', with: 'password'
      click_on '送出'
      expect(page).to have_content '登入成功'
      click_on '查看我的團隊'
      expect(page).to have_content 'It\'s your teams!'
      first(:link, team.name).click
      first(:link, project.title).click
      click_on '刪除專案'
      expect(page).to have_content '專案刪除成功'
    end
  end
end
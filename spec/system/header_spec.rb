require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'Aboutリンクが表示される' do
        about_link = find_all('a')[0].native.inner_text
        expect(about_link).to match(/about/i)
        #is_expected.to have_content 'About'
      end
      it '商品一覧リンクが表示される' do
        item_index_link = find_all('a')[1].native.inner_text
        expect(item_index_link).to match(/items/i)
        #is_expected.to have_content '商品一覧'
      end
      it '新規登録リンクが表示される' do
        signup_link = find_all('a')[2].native.inner_text
        expect(signup_link).to match(/sign up/i)
        #is_expected.to have_content '新規登録'
      end
      it 'ログインリンクが表示される' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/login/i)
        #is_expected.to have_content 'ログイン'
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'Home画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.delete(' ')
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq(root_path)
      end
      it 'About画面に遷移する' do
        about_link = find_all('a')[1].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq(homes_about_path)
      end
      it '商品一覧画面に遷移する' do
        item_index_link = find_all('a')[2].native.inner_text
        item_index_link = item_index_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link item_index_link
        is_expected.to eq(items_path)
      end
      it '新規登録画面に遷移する' do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq(new_user_registration_path)
      end
      it 'ログイン画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq(new_user_session_path)
      end
    end
  end
  
  describe 'ログインしている場合' do
    let(:customer) { create(:customer) }
    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトル、Homeリンクが表示される' do
        is_expected.to have_content 'ながのcake'
      end
      it 'マイページリンクが表示される' do
        customers_link = find_all('a')[0].native.inner_text
        expect(customers_link).to match(/customers/i)
      end
      it '商品一覧リンクが表示される' do
        items_link = find_all('a')[1].native.inner_text
        expect(items_link).to match(/items/i)
      end
      it 'カートリンクが表示される' do
        cart_items_link= find_all('a')[2].native.inner_text
        expect(cart_items_link).to match(/cart_items/i)
      end
      it 'ログアウトリンクが表示される' do
        logout_link = find_all('a')[3].native.inner_text
        expect(logout_link).to match(/logout/i)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'Home画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link home_link
        is_expected.to eq('/')
      end
      it 'マイページ画面に遷移する' do
        customers_link = find_all('a')[1].native.inner_text
        customers_link = customers_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link customers_link
        is_expected.to eq('/customers')
      end
      it '商品一覧画面に遷移する' do
        item_index_link = find_all('a')[2].native.inner_text
        item_index_link = item_index_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link item_index_link
        is_expected.to eq('/items')
      end
      it 'カート機能に遷移する' do
        cart_items_link = find_all('a')[3].native.inner_text
        cart_items_link = cart_items_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link cart_items_link
        expect(page).to have_content 'Signed out successfully.'
      end
      it 'ログアウトする' do
        logout_link = find_all('a')[4].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
        expect(page).to have_content 'Signed out successfully.'
      end
    end
  end
end

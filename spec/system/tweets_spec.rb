require "rails_helper"

describe "投稿管理機能", type: :system do
    
    describe "一覧表示機能" do
        before do
            #ユーザーAを作成
            user_a = FactoryBot.create(:user, name: "ユーザーA", email: "a@test.jp")
            #作成者がユーザーAである投稿を作成
            FactoryBot.create(:tweet, description: "テストAだよ", user: user_a)
        end
        
        context 'ユーザーAがログインしているとき' do
            before do 
                #ユーザーAでログインする
                visit login_path
                fill_in "メールアドレス", with: "a@test.jp"
                fill_in "パスワード", with: "password"
                click_button "ログインする"
            end
            
            it 'ユーザーAが作成した投稿が表示される' do
                #作成済みの投稿が画面上に表示されているか確認
                expect(page).to have_content "テストAだよ"
            end
        end
    end
end
require 'rails_helper'

RSpec.describe 'Category', type: :system do
  before do
    @user1 = User.create!(name: 'Wilhelm Kamulunga', email: 'kamulungaw@gmail.com', password: 'abcd1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    @category = @user1.categories.create!(name: 'Category name', icon: 'https://eat&drink.com/1234')

    @expense1 = Expense.create!(author_id: @user1.id, name: 'expense1', amount: 10)
    @expense2 = Expense.create!(author_id: @user1.id, name: 'expense2', amount: 15)

    @category.expenses << @expense1
    @category.expenses << @expense2
  end

  it 'displays category information on the category index page' do
    visit user_category_path(user_id: @user1.id, id: @category.id)

    expect(page).to have_selector("img[src='#{@category.icon}']")
    expect(page).to have_content('Category name')
    expect(page).to have_content('$15')
  end

  it 'displays category information on the category show page' do
    visit user_category_path(user_id: @user1.id, id: @category.id)

    expect(page).to have_text('Expense1')
    expect(page).to have_content('$10')
    expect(page).to have_text('Expense2')
    expect(page).to have_content('$15')
  end
end
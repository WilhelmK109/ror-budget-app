require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'Wilhelm Kamulunga') }
  subject do
    Expense.new(name: 'Cappuccino', amount: 14, author: user)
  end

  it 'should not be valid if name value set to nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if amount is set to nil' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if amount is less than 0' do
    subject.amount = -2
    expect(subject).to_not be_valid
  end
end

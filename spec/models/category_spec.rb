require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Wilhelm Kamulunga', email: 'invalid_email', password: 'password') }
  subject do
    Category.new(name: 'Cappuccino', icon: 'cupoftea.png', author: user)
  end

  it 'should not be valid if name value equal nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if icon value set to nil' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end

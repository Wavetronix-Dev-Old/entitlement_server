require 'test_helper'

describe Role do
  let(:role) { Factory.build :role }

  it "is a valid object" do
    role.must_be :valid?
  end

  it "requires a name" do
    role.name = ''
    role.wont_be :valid?
  end
end

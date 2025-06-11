require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:desc) }
  it { should validate_presence_of(:price) }

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end

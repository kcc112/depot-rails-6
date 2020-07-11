require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'attributes' do
    it { expect(subject.attributes).to include('title', 'description', 'image_url') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image_url) }
  end
end

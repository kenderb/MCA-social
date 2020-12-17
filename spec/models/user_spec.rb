
require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Kender', fullname: 'Kender Bolivar') }
  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:followings) }
    it { should have_many(:follows) }
    it { should have_many(:inverse_followings) }
    it { should have_many(:followers) }
    it { should have_many(:likes) }
  end
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_length_of(:fullname) }
    it { should validate_length_of(:username) }
    
  end
end

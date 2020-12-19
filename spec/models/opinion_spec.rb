require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:likes) }
  end
  describe 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text) }
  end

  describe 'count_opinion' do
    it 'show numbers of opinions' do
      user1 = User.new(id: 1, username: 'userone', fullname: 'user one name')
      user1.save
      opinion1 = Opinion.new(author_id: user1.id, movie_name: 'IT', text: 'Some opinion for the IT movie')
      opinion2 = Opinion.new(author_id: user1.id, movie_name: 'Inception', text: 'Some opinion for the Inception movie')
      opinion1.save
      opinion2.save
      opinions = user1.opinions.ordered_by_most_recent
      expect(opinions.count_opinion).to eql(2)
    end
  end
end

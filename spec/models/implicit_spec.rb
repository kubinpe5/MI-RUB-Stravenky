require 'rails_helper'

RSpec.describe Implicit, type: :model do
  describe 'columns' do
    [:month, :count].each do |column|
      it { is_expected.to have_db_column(column) }
    end
  end

  it { is_expected.to validate_presence_of(:month) }
  it { is_expected.to validate_presence_of(:count) }

  describe '::for_date' do
    it 'return tickets' do
      date = Date.new(Time.now.year, rand(1..12), 1)
      impl = Implicit.find_by(month: date)
      expect(Implicit.for_date(date)).to eq impl
    end

    it 'returns tickets for next year' do
      date = Date.new(Time.now.year, rand(1..12), 1)
      impl = Implicit.find_by(month: date)

      new_date = Date.new(date.year + 1, date.month, 1)
      expect(Implicit.for_date(new_date).count).to eq impl.count
    end

  end
end

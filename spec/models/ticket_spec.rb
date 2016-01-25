require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'columns' do
    [:user_id, :month, :count, :locked].each do |column|
      it { is_expected.to have_db_column(column) }
    end
  end

  it { is_expected.to validate_presence_of(:month) }
  it { is_expected.to validate_presence_of(:count) }
end

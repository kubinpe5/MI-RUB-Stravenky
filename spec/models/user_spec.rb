require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    [:email, :admin].each do |column|
      it { is_expected.to have_db_column(column) }
    end
  end

  it { is_expected.to validate_presence_of(:email) }
end

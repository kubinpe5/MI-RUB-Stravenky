class Ticket < ActiveRecord::Base
  belongs_to :user

  validates :month, :count, presence: true

  def self.for_year(year, user)
    (1..12).map do |month|
      where(month: Date.new(year, month, 1), user_id: user).first_or_create do |ticket|
        ticket.user = user
        ticket.month = Date.new(year, month, 1)
        ticket.count = Implicit.for_date(ticket.month).count
      end
    end.sort{ |a,b| a.month <=> b.month }
  end
end

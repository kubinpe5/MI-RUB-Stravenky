class Implicit < ActiveRecord::Base
  validates :month, presence: true
  validates :count, presence: true

  def self.for_date( date )
    m = find_by(month: date)
    return m if m
    #months = where(["strftime('%m', month) = ?", date.month.to_s.rjust(2, "0")])
    months = where(["date_part('month', month) = ?", date.month]).order(:month)
    create do |implicit|
      implicit.month = date
      implicit.count = months.last.count
    end
  end
end

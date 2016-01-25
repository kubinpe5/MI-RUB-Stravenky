require 'csv'
class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @year = params[:year].try(:to_i) || Time.now.year
    @year_interval = Date.new(@year, 1, 1)..Date.new(@year, 12, 1)
    @users = User.all.order(:email)
    respond_to do |format|
      format.html
      format.csv do
        data = CSV.generate(headers: true) do |csv|
          csv << %w(email 1 2 3 4 5 6 7 8 9 10 11 12)
          @users.each do |user|
            csv << [user.email] + user.tickets_for(@year_interval).map(&:count)
          end
        end
        send_data data, filename: "users-#{@year}.csv"
      end
    end
  end

  private

  def authenticate_admin!
    unless current_user.try(:admin?)
      redirect_to new_user_session_path
    end
  end
end

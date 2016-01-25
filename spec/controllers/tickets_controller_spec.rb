require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "user" do
    login_user

    describe "GET #index" do
      it "assigns all tickets as @tickets current year" do
        year = Time.now.year
        get :index, {}
        tickets = Ticket.for_year(year, subject.current_user)
        expect(assigns(:tickets).to_a).to eq(tickets)
      end

      it "assigns the requested ticket as @ticket previous year" do
        year = Time.now.year - 1
        get :index, {year: year}
        tickets = Ticket.for_year(year, subject.current_user)
        expect(assigns(:tickets).to_a).to eq(tickets)
      end

      it "assigns the requested ticket as @ticket next year" do
        year = Time.now.year + 1
        get :index, {year: year}
        tickets = Ticket.for_year(year, subject.current_user)
        expect(assigns(:tickets).to_a).to eq(tickets)
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:valid_attributes) {
          {count: 50}
        }
        let(:month) { Date.new(Time.now.year, 1, 1) }
        let(:ticket) { Ticket.for_year(month.year, subject.current_user).find { |m| m.month == month } }

        it "updates the requested ticket" do
          patch :update, {:id => ticket.to_param, :ticket => valid_attributes}
          ticket.reload
          expect(ticket.count).to eq 50
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:valid_attributes) {
          {locked: true}
        }
        let(:month) { Date.new(Time.now.year, 1, 1) }
        let(:ticket) { Ticket.for_year(month.year, subject.current_user).find { |m| m.month == month } }

        it "updates the requested ticket" do
          expect {
            patch :update, {:id => ticket.to_param, :ticket => valid_attributes}
            ticket.reload
          }.to change { ticket.locked }.from(false).to(true)
        end
      end
    end
  end
end
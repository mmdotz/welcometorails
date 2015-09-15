class UsersController < ApplicationController

  def index
    user = User.all
    user_array = user.all.map { |record| "#{record.first_name} #{record.last_name}, #{record.age}" }
    render text: user_array
  end

  def show
    begin
      user = User.find(params[:id])
      render text: "user: #{user.full_name}", status: 200
    rescue ActiveRecord::RecordNotFound
      render text: "Sorry, user with id of #{params[:id]} was not found", status: 404
    end
  end



end

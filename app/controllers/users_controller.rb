class UsersController < ApplicationController

  # def index
  #   user = User.all
  #   user_array = user.all.map { |record| "#{record.first_name} #{record.last_name}, #{record.age}" }
  #   render text: user_array
  # end

  def index
    # render text: "params: #{params.inspect}""
    user = User.where("first_name LIKE ?", "s%")
    user_array_with_s = user.map { |user| "#{user.first_name} #{user.last_name}, #{user.age}" }
    user_array_with_s = user_array_with_s.inspect
    render text: "#{user_array_with_s}"
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

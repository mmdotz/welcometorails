class UsersController < ApplicationController

  def index
    user = User.all
    user_array = user.all.map { |record| "#{record.first_name} #{record.last_name}, #{record.age}" }
    render text: user_array
  end

end

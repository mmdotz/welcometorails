class UsersController < ApplicationController

  def index
    if params.has_key?(:first_name)
      user = User.where("first_name LIKE ?", params[:first_name])
      user_array_with_s = user.map { |user| "#{user.first_name} #{user.last_name}, #{user.age}" }
      user_array_with_s = user_array_with_s.inspect
      render text: "#{user_array_with_s}"
    end
    if params[:id] == nil
      user = User.all
      user_array = user.all.map { |record| "#{record.first_name} #{record.last_name}, #{record.age}" }
      render text: user_array
    end
  end

  def show #see MAtt's notes in slack
    begin
      user = User.find(params[:id])
      render text: "user: #{user.full_name}", status: 200
    rescue ActiveRecord::RecordNotFound
      render text: "Sorry, user with id of #{params[:id]} was not found", status: 404
    end
  end

  def delete
    if params.has_key?("delete")
      user = User.find(params[:id])
      user.destroy
      render text: "user was deleted"
    else
      render text: "user: #{user.full_name}", status: 200
    rescue ActiveRecord::RecordNotFound
      render text: "Sorry, user with id of #{params[:id]} was not found", status: 404
    end
  end


# #keep these methods to show params only
    # def index
    #   render text: "params: #{params.inspect}"
    # end

    # def show
    #   render text: "params: #{params.inspect}"
    # end
end


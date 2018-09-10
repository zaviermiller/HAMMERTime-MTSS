class MainController < ApplicationController

  def index
    unless user_signed_in?

      redirect_to main_home_path

    else

      if current_user.today.sunday?
        current_user.today += 1
        current_user.save!
      elsif current_user.today.saturday?
        current_user.today += 2
        current_user.save!
      end


      if @date.nil?
        @date = Date.today
      end

      if current_user.studentid.include?("teacher") && current_user.dept.nil?
        redirect_to edit_user_registration_path(current_user)
      end

      if current_user.role.nil? && !current_user.studentid.include?("teacher")
        current_user.student!
        current_user.friend = []
        current_user.save!
      elsif current_user.studentid.include?("teacher")
        current_user.teacher!
        current_user.save!
      end

      @users = User.all
      @rooms = Room.all
      @room = Room.new
      @departments = Hash.new
      @departments = { 0 => "Science", 1 => "Math", 2 => "Social Studies", 3 => "English", 4 => "Fine Arts", 5 => "Electives" }
    end

    @rooms = Room.all
  end

  def home
  end

  def next
    current_user.today += 1
    current_user.save!
    redirect_to root_path
  end

  def prev
    current_user.today -= 1
    current_user.save!
    redirect_to root_path
  end

end

class MainController < ApplicationController

  def index
    unless user_signed_in?

      redirect_to main_home_path

    else

      if current_user.teacher? && current_user.room.nil?
        redirect_to edit_user_registration_path(current_user)
      end

      @test = 1
      @users = User.all
      @rooms = Room.all
      @room = Room.new
      @departments = Hash.new
      @departments = { 0 => "Science", 1 => "Math", 2 => "Social Studies", 3 => "English", 4 => "Fine Arts", 5 => "Electives" }
      @dates = { 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday" }
    end

    @rooms = Room.all
  end

  def home
  end

  def absent
    @user = User.find_by(id: params[:id])
    unless @user.absent?
      @user.absent = true
      @user.save!
    else
      @user.absent = false
      @user.save!
    end
    redirect_to root_path
  end

  def next
    if current_user.student?
      current_user.today += 1
      current_user.save!

      if current_user.today.sunday?
        current_user.today += 1
        current_user.save!
      elsif current_user.today.saturday?
        current_user.today += 2
        current_user.save!
      end
    else
      if current_user.today == Time.zone.today
        current_user.today = Time.zone.today - Time.zone.today.wday
        current_user.save!
      else
        current_user.today = Time.zone.today
        current_user.save!
      end
    end

    redirect_to root_path
  end

  def prev
    if current_user.student?
      current_user.today -= 1
      current_user.save!
      if current_user.today.sunday?
        current_user.today -= 2
        current_user.save!
      elsif current_user.today.saturday?
        current_user.today -= 1
        current_user.save!
      end
    else
      if current_user.today == Time.zone.today
        current_user.today = Time.zone.today - Time.zone.today.wday
        current_user.save!
      else
        current_user.today = Time.zone.today
        current_user.save!
      end
    end

    redirect_to root_path
  end

  def addfriend
    @friend = User.find_by(id: params[:id])
    current_user.friend = current_user.friend.push(@friend.id)
    current_user.save!
    redirect_to root_path

  end

end

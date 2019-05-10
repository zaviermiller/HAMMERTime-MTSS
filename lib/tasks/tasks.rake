namespace :tasks do
  desc "Destroy all requests, set absent to 0, and set date to today everyday"
  task delete_requests: :environment do
    puts("Deleting requests...")
    Request.delete_all
    puts('Requests deleted.')
    puts("Setting user data...")
    User.all.each do |user|
      user.absent = false
      user.today = Time.zone.today
      user.class_id = Room.all.where(user_id: User.all.where(id: user.home),date: Time.zone.today)
      user.save!
      puts('Data reset for ' + user.first + ' ' + user.last + '.')
    end
    puts('All users reset.')
  end

  desc "Destroy all rooms on Friday"
  task delete_rooms: :environment do
    if Time.zone.today.saturday?
      puts("Deleting rooms...")
      Room.delete_all
      puts("Past week rooms deleted.")
    else
      puts("No rooms deleted.")
    end
  end

end

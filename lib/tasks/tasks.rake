namespace :tasks do
  desc "Destroy all requests, set absent to 0, and set date to today everyday"
  task delete_requests: :environment do
    print("Deleting requests...")
    Request.delete_all
    print('Requests deleted.')
    print("Setting user data...")
    User.all.each do |user|
      user.absent = false
      user.today = Time.zone.today
      user.class_id = 0
      user.save!
      print('Data reset for ' + user.first + ' ' + user.last + '.')
    end
    print('All users reset.')
  end

  desc "Destroy all rooms on Friday"
  task delete_rooms: :environment do
    if Time.zone.today.saturday?
      print("Deleting rooms...")
      Room.delete_all
      print("Past week rooms deleted.")
    else
      print("No rooms deleted.")
    end
  end

end

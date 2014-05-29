# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)


# Question: Is there a way to code this without requiring all the
# attributes to be accessible in the model??

#**** Gralbums ****#

# Notice that if any of the "max" fields are not specified,
# there is no limit on the number

# Book of Sarth

bos = Gralbum.find_or_create_by_gralbumID(
    :gralbumID => 'b1f0c797d6e74161fb46',
    :title => 'Book of Sarth',
    :artist => 'Sarth',
    :numTracks => '8',
    :trackTitles => 'To Your Rescue**My Mainia Is Forgotten Until Too Late**Walking Slowly**For the Door Store**Primary Deforestation**Casting Nets at Night**If I Can**Blacklist',
    :downloadFileName => 'BOS.zip',
    :url => 'bookofsarth',
    :secret => 'eDbYigl9N9lXouj8hfm2C3P97J18PKnKAc_ZTYQKHUyyJoeQaNibnA',
    :maxNumRequests => '5',
    :maxTimeDownloadValid =>'72',
    :maxNumDownloads =>'3',
    :maxTotalNumDownloads => '7',
    :maxUsersPerDevice => '4')

# Add another book using this template:
#shortBookName = Gralbum.find_or_create_by_gralbumID(
# # Randomly generate this using SecureRandom.hex(0)
# # The app also needs to know this id
# :gralbumID => '',
# :title => '',
# :artist => '',
# :numTracks => '',
# # Separate trackTitles with **
# :trackTitles => '',
# # Base name for html file in app/views/gralbums/
# :url => '',
# # Randomly generate this use 54 characters from (a-zA-Z0-9_)
# # The app also needs to know this secret
# :secret => '',
# #The below are not required; if left out they are infinite
# # see db/migrate/...gralbums.rb
# :maxNumRequests => '5',
# :maxTimeDownloadValid => '72',
# :maxNumDownloads => '3',
# :maxTotalNumDownloads => '7',
# :maxUsersPerDevice => '4')

# Add another book using this template:
#shortBookName = Gralbum.find_or_create_by_gralbumID(
   # Randomly generate this using SecureRandom.hex(0)
   # The app also needs to know this id
   :gralbumID => 'BOSFreeIfICan',
   :title => 'If I Can',
   :artist => 'Sarth',
   :numTracks => '1',
   # Separate trackTitles with **
   :trackTitles => 'If I Can',
   # Base name for html file in app/views/gralbums/
   :url => 'ifican',
   # Randomly generate this use 54 characters from (a-zA-Z0-9_)
   # The app also needs to know this secret
   :secret => 'eDbYigl9N9lXouj8hfm2C3P97J18PKnKAc_ZTYQKHUyyJoeQaNibnA',
   #The below are not required; if left out they are infinite
   # see db/migrate/...gralbums.rb
   :maxNumRequests => '5',
   :maxTimeDownloadValid => '72',
   :maxNumDownloads => '3',
   :maxTotalNumDownloads => '7',
   :maxUsersPerDevice => '4')

# Add another book using this template:
#shortBookName = Gralbum.find_or_create_by_gralbumID(
   # Randomly generate this using SecureRandom.hex(0)
   # The app also needs to know this id
   :gralbumID => 'fromjson',
   :title => 'O Pastor',
   :artist => 'Bora Yoon',
   :numTracks => '1',
   # Separate trackTitles with **
   :trackTitles => 'O Pastor Animarum',
   # Base name for html file in app/views/gralbums/
   :url => 'opastor',
   # Randomly generate this use 54 characters from (a-zA-Z0-9_)
   # The app also needs to know this secret
   :secret => 'eDbYigl9N9lXouj8hfm2C3P97J18PKnKAc_ZTYQKHUyyJoeQaNibnA',
   #The below are not required; if left out they are infinite
   # see db/migrate/...gralbums.rb
   :maxNumRequests => '5',
   :maxTimeDownloadValid => '72',
   :maxNumDownloads => '3',
   :maxTotalNumDownloads => '7',
   :maxUsersPerDevice => '4')


# Add another book using this template:
test = Gralbum.find_or_create_by_gralbumID(
    :gralbumID => '2',
    :title => 'Test',
    :artist => 'Unknown',
    :numTracks => '1',
    :trackTitles => 'A Track',
    :url => 'test1',
    :secret => 'easy',
    :maxNumRequests => '5',
    :maxTimeDownloadValid => '8',
    :maxNumDownloads => '3',
    :maxTotalNumDownloads => '7',
    :maxUsersPerDevice => '4')

# Can add in test devices/users/download_requests here
dev1 = Device.find_or_create_by_deviceID(:deviceID => '1')

hash = Digest::SHA256.hexdigest("password".to_s + "salt".to_s)
user = User.find_or_create_by_email( :email => "helena@watson.org",
 :password_salt => "salt", :password_hash => hash, :numLoginTries => '0',
 :loginTimeStamp => Time.now)
user.devices.clear
user.devices<<dev1
user.gralbums.clear
user.gralbums<< bos

hash = Digest::SHA256.hexdigest("password".to_s + "salt".to_s)
user2 = User.find_or_create_by_email( :email => "whiddershins@gmail.com",
 :password_salt => "salt", :password_hash => hash, :numLoginTries => '0',
 :loginTimeStamp => Time.now)
user2.devices.clear
user2.devices<<dev1
user2.gralbums.clear
user2.gralbums=bos,test


DownloadRequest.create( { :gralbum_id => bos.id,
:user_id => user.id, :device_id => dev1.id, :numDownloads => 0, :numTrackDownloads => "0,0,0,0,0,0,0,0" })
#download_request = DownloadRequest.new
#download_request.gralbum_id = bos.id
#download_request.user_id = user.id
#download_request.device_id = dev1.id
#download_request.numDownloads = 0
#download_request.numTrackDownloads = "0,0,0,0,0,0,0,0"
#download_request.save!

DownloadRequest.create( { :gralbum_id => bos.id,
:user_id => user2.id, :device_id => dev1.id, :numDownloads => 0, :numTrackDownloads => "0,0,0,0,0,0,0,0" })
#download_request = DownloadRequest.new
#download_request.gralbum_id = bos.id
#download_request.user_id = user2.id
#download_request.device_id = dev1.id
#download_request.numDownloads = 0
#download_request.numTrackDownloads = "0,0,0,0,0,0,0,0"
#download_request.save!

DownloadRequest.create( { :gralbum_id => test.id,
:user_id => user2.id, :device_id => dev1.id, :numDownloads => 0, :numTrackDownloads => "0" })
#download_request = DownloadRequest.new
#download_request.gralbum_id = test.id
#download_request.user_id = user2.id
#download_request.device_id = dev1.id
#download_request.numDownloads = 0
#download_request.numTrackDownloads = '0'
#download_request.save!
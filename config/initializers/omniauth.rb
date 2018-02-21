Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
 	#get permission through pop-up. additional from the basic hash information
 	scope: 'email,user_birthday,user_location,public_profile', info_fields: 'email,first_name,last_name,birthday,gender,location', display: 'popup';
end
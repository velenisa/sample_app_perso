class UserProfile < ActiveRecord::Base
  attr_accessible :profile_active, :profile_admin, :profile_code, :profile_name
end

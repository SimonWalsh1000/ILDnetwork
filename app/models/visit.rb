class Visit < ActiveRecord::Base

  geocoded_by :ip_address

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end

  after_validation :geocode

  before_save :reverse_geocode

end
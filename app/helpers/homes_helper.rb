module HomesHelper
  def random_coords
    coords = Rails.env.test? ? {lat: 45, lon: 90} : {lat: rand(-90.0..90.0), lon: rand(-180.0..180.0)}
  end
end

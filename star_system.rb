class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets = [])
    @name = name
    @planets = planets
  end

  def planet_names()
    planet_names = planets.map { |planet| planet.name }
    #return planet_names
  end

  def get_planet_by_name(planet_name)
    planet_found = planets.find { |planet| planet.name == planet_name }
  end

  def get_planets_with_no_moons()
    planets_with_no_moons = planets.find_all { |planet| planet.number_of_moons == 0 }
    return planets_with_no_moons
  end

  def get_planets_with_more_moons(number_of_moons)
    result = planets.find_all { |multi_moon_planet| multi_moon_planet.number_of_moons > number_of_moons }
    planets_with_moons = result.map { |moon_planets| moon_planets.name }
    return planets_with_moons
  end

  def get_number_of_planets_closer_than(distance)
    planets_close_to_sun = planets.find_all { |sun_planets| sun_planets.distance_from_sun < distance }
    return planets_close_to_sun.size()
  end

  ################
  ###EXTENSIONS###
  ################

  def get_largest_planet()
    biggest_planet = planets.sort_by { |planet| planet.diameter }
    return biggest_planet.last()
  end

   def get_smallest_planet()
     smallest_planet = planets.sort_by { |planet| planet.diameter }
     return smallest_planet.first()
   end

  def get_total_number_of_moons
    total_moons = planets.reduce(0) { |running_total, planet| running_total + planet.number_of_moons }
    return total_moons
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    result = []
    biggest_planets = planets.sort_by { |planet| planet.distance_from_sun }
    biggest_planets.each { |planet| result.push(planet.name) }
    return result
  end

  def get_planet_names_sorted_by_size_decreasing
    result = []
    assorted_planets = planets.sort_by { |planet| planet.diameter }
    assorted_planets.reverse_each { |planet| result.push(planet.name) }
    return result
  end

end


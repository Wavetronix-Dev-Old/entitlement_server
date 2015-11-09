Factory.define :identity do |i|
  i.first_name 'Barney'
  i.last_name 'Rubble%d'
  i.email { |o| "#{o.first_name.downcase}.#{o.last_name.downcase}@example.com"}
  i.location 'Rock Pit'
  i.description 'Rock Digger'
  i.password i.password_confirmation('betty')
end

Factory.define :identity do |i|
  i.first_name "Barney"
  i.last_name "Rubble%d"
  i.email { |o| "#{o.first_name.downcase}.#{o.last_name.downcase}@example.com"}
  i.company "Rock Pit"
  i.job_title "Rock Digger"
  i.password i.password_confirmation("betty")
end

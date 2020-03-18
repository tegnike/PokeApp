User.seed do |s|
  s.name = "admin"
  s.email = "admin@test.com"
  s.password = "password"
  s.password_confirmation = "password"
  s.admin = true
end

User.seed do |s|
  s.name = "test"
  s.email = "test@test.com"
  s.password = "password"
  s.password_confirmation = "password"
end

user = User.new
user.email = 'test@example.com'
user.password = 'admin1'
user.password_confirmation = 'admin1'
user.username = 'John'
user.save!

user = User.new
user.email = 'test@example2.com'
user.password = 'admin1'
user.password_confirmation = 'admin1'
user.username = 'Ben'
user.save!

user = User.new
user.email = 'admin@admin.com'
user.password = 'admin1'
user.password_confirmation = 'admin1'
user.username = 'Admin'
user.save!

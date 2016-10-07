namespace :db do
  desc "Create default admin account"
  task admin: :environment do
    admin = User.create(
      user_name: "Admin",
      email: "admin@gmail.com",
      password: "123123",
      isadmin: true
    )
  end
end

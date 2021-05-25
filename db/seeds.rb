ApplicationRecord.transaction do
  User.destroy_all
  Customer.destroy_all

  User.create!(email: "test@gmail.com", password: "123456", password_confirmation: "123456")

  3.times do |cc|
    customer = Customer.create!(name: "Customer #{cc}")

    3.times do |pp|
      project = Project.create!(customer: customer, name: "Project #{cc}-#{pp}")

      3.times do |tt|
        Task.create!(project: project, description: "Task description #{cc}-#{pp}-#{tt}")
      end
    end
  end
end

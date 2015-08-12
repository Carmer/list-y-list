class Seed

  def self.go
    Rails.env == "production" ? production : development
  end

  def self.production
    generate_lists
    generate_tasks
  end

  def self.development
    generate_lists
    generate_tasks
  end

  def self.generate_tasks
    200.times do |i|
      p "task #{i} generated"
      Task.create!(title: Faker::App.name,
                   notes: Faker::Lorem.sentence(3),
                   due_date: Faker::Date.forward(i + i),
                   start_date: Faker::Date.forward(i),
                   list_id: random_list_id)
    end
  end

  def self.generate_lists
    10.times do |i|
      p "list #{i} generated"
      List.create!(title: Faker::Commerce.product_name,
                   description: Faker::Lorem.sentence(3))
    end
  end

  private

  def self.all_lists
    List.all
  end

  def self.random_list_id
    all_lists.sample.id
  end

end

Seed.go

class Project < ApplicationRecord
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects
  validates_presence_of :name, :material
  belongs_to :challenge

  def contestant_count
    self.contestants.count
  end

  def average_years_exp
    total_years = 0
    self.contestants.each do |c|
      total_years += c.years_of_experience
    end
    total_years.to_f/self.contestant_count
  end

end
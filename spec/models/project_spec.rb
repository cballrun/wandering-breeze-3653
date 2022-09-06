require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  it 'counts the number of contestants on it' do
    @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @cp_1 = ContestantProject.create!(contestant_id: @jay.id, project_id: @news_chic.id)
  
    expect(@news_chic.contestant_count).to eq(1)
  end

end
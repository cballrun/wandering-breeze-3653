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

  before :each do
    @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    
    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

    @cp_1 = ContestantProject.create!(contestant_id: @jay.id, project_id: @news_chic.id)
    @cp_2 = ContestantProject.create!(contestant_id: @gretchen.id, project_id: @news_chic.id)
    @cp_3 = ContestantProject.create!(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
  end

  it 'counts the number of contestants on it' do
    expect(@upholstery_tux.contestant_count).to eq(1)
    expect(@news_chic.contestant_count).to eq(2)
  end

  it 'can tell the average of the years of experience for contestants that worked on it' do
    
    expect(@upholstery_tux.average_years_exp).to eq(12)
    expect(@news_chic.average_years_exp).to eq(12.5)
  end


end
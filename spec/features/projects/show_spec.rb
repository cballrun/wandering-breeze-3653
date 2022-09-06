require 'rails_helper'

RSpec.describe 'the Project show' do
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

  it "shows the Project and all its attributes" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
    expect(page).to have_content(@recycled_material_challenge.theme)
  end

  it 'has a count of the number of contestants on a Project' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(2)
  end

  it 'displays the average number of years of experience for all contestants on the project' do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content(12.5)
  end



end
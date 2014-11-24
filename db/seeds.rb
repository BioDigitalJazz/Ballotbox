require 'factory_girl'
require 'faker'

require_relative '../config/environment'
require_relative '../config/database'

# The demo presentation

p_demo = Presentation.create(title: "Ballotbox Demo", description: "Initial demo at Lighthouse Labs")
1.upto(4) do |i|
  s_type = i.odd? ? 'regular' : 'survey'
  s_img_path = "img/#{p_demo.id}/slide_#{i}.jpg" 
  s_content = "<div class="slide"><img src='s_img_path'></div>"
  s_demo = p_demo.slides.create(slide_number: i, slide_type: s_type, content: s_content)
end

survey_1 = p_demo.slides.find(2)
survey_1.survey_options.create(option_label: 'a', text: 'Ruby')
survey_1.survey_options.create(option_label: 'b', text: 'HTML/CSS')
survey_1.survey_options.create(option_label: 'c', text: 'JavaScript/jQuery')
survey_1.survey_options.create(option_label: 'd', text: 'You know other languages?! Get a life asap')
survey_2 = p_demo.slides.find(4)
survey_2.survey_options.create(option_label: 'a', text: 'The audience')
survey_2.survey_options.create(option_label: 'b', text: 'The instructors')
survey_2.survey_options.create(option_label: 'c', text: 'The midterm test')
survey_2.survey_options.create(option_label: 'd', text: 'Everyone else (except the demo team')

# Random presentations andslides generated below

FactoryGirl.define do
  factory :presentation do
    title { Faker::Commerce.product_name }
    description "Some description"
  end
end

1.upto(3) do |pi| 
  pre = FactoryGirl.create(:presentation)

  ses1 = pre.sessions.create(access_code: Faker::Address.zip)

  1.upto(5) do |si|
    s_type = si.odd? ? 'regular' : 'survey'
    # s_content = "<div>#{Faker::Hacker.say_something_smart}</div>"
    s_content = "<div>#{Faker::Lorem.paragraph}</div>"
    sli = pre.slides.create(slide_number: si, slide_type: s_type, content: s_content)

    if s_type == 'survey'
      ('a'..'d').each do |label|
        opt = sli.survey_options.create(option_label: label, text: Faker::Company.name)

        votes = rand(10)
        1.upto(votes) { |fi| opt.survey_feedbacks.create(session: ses1) }
      end
    end
  end
end
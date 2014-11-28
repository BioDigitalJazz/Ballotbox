require 'factory_girl'
require 'faker'

require_relative '../config/environment'
require_relative '../config/database'

# The demo presentation

p_demo = Presentation.create(title: "Ballotbox Demo", description: "Initial demo at Lighthouse Labs")

1.upto(5) do |i|
  if i.odd?
    s_type = 'regular'
    s_img_path = "/img/presentation/#{p_demo.id}/slide_#{i}.jpg" 
    s_content = "<div class='slide_regular' style='border: 2px solid black;'><img src='#{s_img_path}' style='width: 600px; height: 400px;'></div>"
  else
    s_type = 'survey'
    s_content = "Survey Question"
  end
  s_demo = p_demo.slides.create(slide_number: i, slide_type: s_type, content: s_content)
end

survey_1 = p_demo.slides.find(2)
survey_1.content = "<h3>Choose Your Poison:</h3>"
survey_1.save

survey_2 = p_demo.slides.find(4)
survey_2.content = "<h3>Something went wrong with the presentation. Blame:</h3>"
survey_2.save

op1 = {}
op1['a'] = survey_1.survey_options.create(option_label: 'a', text: 'Ruby')
op1['b']  = survey_1.survey_options.create(option_label: 'b', text: 'HTML/CSS')
op1['c'] = survey_1.survey_options.create(option_label: 'c', text: 'JavaScript/jQuery')
op1['d'] = survey_1.survey_options.create(option_label: 'd', text: 'You know other languages?! Get a life asap')

op2 = {}
op2['a'] = survey_2.survey_options.create(option_label: 'a', text: 'The audience')
op2['b'] = survey_2.survey_options.create(option_label: 'b', text: 'The instructors')
op2['c'] = survey_2.survey_options.create(option_label: 'c', text: 'The midterm test')
op2['d'] = survey_2.survey_options.create(option_label: 'd', text: 'Everyone (except the demo team')

tp1 = p_demo.track_presentations.create(access_code: '56469')

'a'.upto('d') do |label|
  option = op1[label]
  votes = rand(10)
  1.upto(votes) { |fi| option.survey_feedbacks.create(track_presentation: tp1) }
end

'a'.upto('d') do |label|
  option = op2[label]
  votes = rand(10)
  1.upto(votes) { |fi| option.survey_feedbacks.create(track_presentation: tp1) }
end


# Random presentations andslides generated below

# FactoryGirl.define do
#   factory :presentation do
#     title { Faker::Commerce.product_name }
#     description "Some description"
#   end
# end

# 3.times { FactoryGirl.create(:presentation) }


# 1.upto(5) do |si|
#     s_type = si.odd? ? 'regular' : 'survey'
#     # s_content = "<div>#{Faker::Hacker.say_something_smart}</div>"
#     s_content = "<div>#{Faker::Lorem.paragraph}</div>"
#     sli = pre.slides.create(slide_number: si, slide_type: s_type, content: s_content)

#     if s_type == 'survey'
#       ('a'..'d').each do |label|
#         opt = sli.survey_options.create(option_label: label, text: Faker::Company.name)

#         votes = rand(10)
#         1.upto(votes) { |fi| opt.survey_feedbacks.create(track_presentation: ses1) }
#       end
#     end
#   end
require 'factory_girl'
require 'faker'

require_relative '../config/environment'
require_relative '../config/database'

# @seed_spec = PG_SPEC.dup
# @seed_spec[:database] = 'ballotbox'
# ActiveRecord::Base.establish_connection(@seed_spec)

FactoryGirl.define do
  factory :presentation do
    title { Faker::Commerce.product_name }
    description "Some description"
  end
end

1.upto(3) do |pi| 
  pre = FactoryGirl.create(:presentation)
  1.upto(5) do |si|
    s_type = si.odd? ? 'regular' : 'survey'
    s_content = "<div>#{Faker::Hacker.say_something_smart}</div>"
    sli = pre.slides.create(slide_number: si, slide_type: s_type, content: s_content)

    if s_type == 'survey'
      'a'..'d'.each do |label|
        option_text = Faker::Hacker.noun
        sli.survey_options.create(option_label: label, text: #{option_text} )
      end
    end
  end
end
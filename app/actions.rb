# Homepage (Root path)

get '/' do
  erb :index
end

get '/present/:presentation_access_code' do
  #page viewed by users in a presentation
end

get 'survey_results/:presentation_access_code' do
  #list of survey feedback from presentations
end

get '/presentations' do
  #list of presentations, options to edit/delete
end

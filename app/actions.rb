# Homepage (Root path)

get '/' do
  erb :index
end

get '/present/:presentation_access_code' do
  #presentation landing page
end

get '/present/:presentation_access_code/:slide number' do
  #a particular slide in a presentation
end

get 'survey_results/:presentation_access_code' do
  #list of survey feedback from presentations
end

get '/presentations' do
  #list of presentations, options to edit/delete
end

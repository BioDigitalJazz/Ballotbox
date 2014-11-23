
helpers do

  def get_presentation
    get_session.presentation
  end

  def get_session
    Session.where(:access_code == session[:presentation_access_code]).first
  end

  def advance_slide
    if !(session[:slide_number] >= get_presentation.slides.count)
      session[:slide_number] += 1
    end
  end

  def back_slide
    session[:slide_number] -= 1
  end
end

get '/' do
  erb :index
end

get '/go_to/present/:presentation_access_code' do
  session[:presentation_access_code] = params[:presentation_access_code]
  session[:slide_number] = 1
  redirect "/present/#{session[:presentation_access_code]}/#{session[:slide_number]}"
end

get '/present/:presentation_access_code/next' do
  advance_slide
  redirect "/present/#{session[:presentation_access_code]}/#{session[:slide_number]}"
end

get '/present/:presentation_access_code/:slide_number' do
  erb :'/present/presentation'
end

get '/present/:presentation_access_code/previous_slide' do
  back_slide
  redirect "/present/:#{session[:presentation_access_code]}/:#{session[:slide_number]}"
end


post '/present/:presentation_access_code/:slide_number/vote/:survey_option' do
  option = SurveyOption.where(survey_option: survey_option_id)
  SurveyFeedback.create(survey_option: option, session: get_session)
end
######This is another way to do it.  I thought I'd keep the code around for now -DH
# post '/present/:presentation_access_code/:slide_number/vote/:survey_option' do
#   get_session.presentation.slides.where(slide_number: session[:slide_number]).first.register_vote(:survey_option)
#   redirect "/present/:#{session[:presentation_acces_code]}/:#{session[:slide_number]}"
# end

# get 'survey_results/:presentation_access_code' do
#   #list of survey feedback from presentations
# end

# get '/presentations' do
#   #list of presentations, options to edit/delete
# end


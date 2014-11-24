Sinatra::register Gon::Sinatra

helpers do

  def get_presentation
    get_track_presentation.presentation
  end

  def get_track_presentation
    TrackPresentation.where(:access_code == session[:presentation_access_code]).first
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
  @tp = TrackPresentation.where(:access_code == params[:presentation_access_code]).first
  @p = @tp.presentation
  @the_slides = @p.slides.where(slide_number: params[:slide_number])
  @slide = @the_slides.first
  test = params[:slide_number]
  # binding.pry
  erb :'/present/presentation'
end

get '/present/:presentation_access_code/previous' do
  back_slide
  redirect "/present/:#{session[:presentation_access_code]}/:#{session[:slide_number]}"
end

get '/survey_feedback' do
  @tp = TrackPresentation.where(:access_code == session[:presentation_access_code]).first
  @p = @tp.presentation
  @the_slides = @p.slides.where(slide_number: session[:slide_number])
  @slide = @the_slides.first
  @survey_options = @slide.survey_options

  gon.survey_options  = []
  gon.option_votes  = []
  @survey_options.each_with_index do |survey_option, index|
    gon.survey_options[index] = "#{survey_option.option_label} : #{survey_option.text}"
    gon.option_votes[index] = SurveyFeedback.where(track_presentation: @tp, survey_option: survey_option).count
    # binding.pry
  end

  erb :survey_feedback
end

post '/present/:presentation_access_code/:slide_number/vote' do
  option = SurveyOption.find(params[:selected_option])
  SurveyFeedback.create(survey_option: option, track_presentation: get_track_presentation)
  redirect '/survey_feedback'
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


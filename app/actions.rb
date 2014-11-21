# Homepage (Root path)

helpers do

  def get_presentation
    Session.where[access_code: session[:presentation_access_code]].presentation
  end

  def advance_slide
    if session[:slide_number] >= get_presentation.slides.count
      redirect '/present/:presentation_access_code'
    else
      session[:slide_number] += 1
    end
  end

  def back_slide
    session[:slide]
  end
end

get '/' do
  erb :index
end

get '/present/go_to/:presentation_access_code' do
  session[presentation_access_code: params[:presentation_access_code]]
  session[:slide_number] = 1
  redirect "/present/presentation/:#{session[:presentation_acces_code]}"
end

get '/present/presentation/:presentation_access_code' do
  erb :'/present/presentation'
end

get '/present/:presentation_access_code/:slide_number' do
  #a particular slide in a presentation
end

get 'survey_results/:presentation_access_code' do
  #list of survey feedback from presentations
end

get '/presentations' do
  #list of presentations, options to edit/delete
end

post '/present/:presentation_access_code/:slide_number/vote/:survey_option_id' do

end

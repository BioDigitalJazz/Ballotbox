configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  if development?
    set :database, {
      adapter:  'postgresql',
      host:     'localhost',
      database: 'ballotbox',
      username: 'ballotbox_admin',
      password: 'slides'
    }
  else
    set :database, ENV['DATABASE_URL']
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end

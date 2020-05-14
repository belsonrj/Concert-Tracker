require './config/environment'

ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable %w(UserData)
end

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use PerformersController 
use UsersController  
use VenuesController 
run ApplicationController

module SymetrieCom

  if Rails.version >= "3.0.0"
    class Engine < Rails::Engine
    end
  else
    ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), '..', 'app', "helpers")
  end

end

require "symetrie_com/acts_as_better_nested_set"

ActiveRecord::Base.class_eval do
  include SymetrieCom::Acts::NestedSet
end

require 'rdf/json'
require 'rdf/spec'

Spec::Runner.configure do |config|
  config.include(RDF::Spec::Matchers)
end

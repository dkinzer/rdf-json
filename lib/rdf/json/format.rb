module RDF::JSON
  ##
  # RDF/JSON format specification.
  #
  # @example Loading RDF/JSON format support
  #   require 'rdf/json'
  #
  # @example Obtaining an RDF/JSON format class
  #   RDF::Format.for(:json)         #=> RDF::JSON::Format
  #   RDF::Format.for("etc/doap.json")
  #   RDF::Format.for(:file_name      => "etc/doap.json")
  #   RDF::Format.for(:file_extension => "json")
  #   RDF::Format.for(:content_type   => "application/json")
  #
  # @see http://n2.talis.com/wiki/RDF_JSON_Specification
  class Format < RDF::Format
    content_type     'application/json', :extension => :json
    content_encoding 'utf-8'

    reader { RDF::JSON::Reader }
    writer { RDF::JSON::Writer }

    require 'json'
  end # Format
end # RDF::JSON

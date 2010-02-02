module RDF::JSON
  ##
  # RDF/JSON extensions for RDF.rb classes.
  module Extensions
    ##
    # RDF/JSON extensions for `RDF::Value`.
    module Value
      ##
      # Returns the serialized RDF/JSON representation of this value.
      #
      # @return [String]
      def to_json
        # Any RDF/JSON-compatible class must implement `#to_rdf_json`:
        to_rdf_json.to_json
      end
    end

    ##
    # RDF/JSON extensions for `RDF::Node`.
    module Node
      ##
      # Returns the RDF/JSON representation of this blank node.
      #
      # @return [Hash]
      def to_rdf_json
        {:type => :bnode, :value => to_s}
      end
    end

    ##
    # RDF/JSON extensions for `RDF::URI`.
    module URI
      ##
      # Returns the RDF/JSON representation of this URI reference.
      #
      # @return [Hash]
      def to_rdf_json
        {:type => :uri, :value => to_s}
      end
    end

    ##
    # RDF/JSON extensions for `RDF::Literal`.
    module Literal
      ##
      # Returns the RDF/JSON representation of this literal.
      #
      # @return [Hash]
      def to_rdf_json
        case
          when datatype? # FIXME: use `has_datatype?` in RDF.rb 0.1.0
            {:type => :literal, :value => value.to_s, :datatype => datatype.to_s}
          when language? # FIXME: use `has_language?` in RDF.rb 0.1.0
            {:type => :literal, :value => value.to_s, :lang => language.to_s}
          else
            {:type => :literal, :value => value.to_s}
        end
      end
    end

    ##
    # RDF/JSON extensions for `RDF::Statement`.
    module Statement
      ##
      # Returns the RDF/JSON representation of this statement.
      #
      # @return [Hash]
      def to_rdf_json
        if object.is_a?(RDF::Value)
          {subject.to_s => {predicate.to_s => [object.to_rdf_json]}}
        else
          # FIXME: improve the RDF::Statement constructor in RDF.rb 0.1.0
          {subject.to_s => {predicate.to_s => [RDF::Literal.new(object).to_rdf_json]}}
        end
      end
    end
  end # module Extensions

  Extensions.constants.each do |klass|
    RDF.const_get(klass).send(:include, Extensions.const_get(klass))
  end
end # module RDF::JSON

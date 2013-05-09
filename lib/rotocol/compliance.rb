require 'active_support/inflector'

module Rotocol
  module Compliance
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def comply_to *protocols
        protocols.each do |protocol|
          protocol_klass = const_get(protocol.to_s.classify)

          if defined?(protocol_klass)
            @required_methods ||= {}
            @required_methods[protocol] = protocol_klass.required_methods

            @optional_methods ||= {}
            @optional_methods[protocol] = protocol_klass.optional_methods
          end
        end
      end

      def required_methods
        @required_methods || {}
      end

      def optional_methods
        @optional_methods || {}
      end
    end
  end
end

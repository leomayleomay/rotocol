module Rotocol
  module Instruction
    def self.included(base)
      base.extend ClassMethods
    end

    def initialize
      raise "You are trying to instantiate a protocol!"
    end

    module ClassMethods
      def required(*methods)
        @required_methods = methods
      end

      def optional(*methods)
        @optional_methods = methods
      end

      def required_methods
        @required_methods || []
      end

      def optional_methods
        @optional_methods || []
      end
    end
  end
end

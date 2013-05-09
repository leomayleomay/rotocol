require 'spec_helper'
require File.expand_path('../../../../lib/rotocol/instruction.rb', __FILE__)

class AProtocol
  include Rotocol::Instruction
end

class BProtocol
  include Rotocol::Instruction

  required :method_1, :method_2, :method_3
end

class CProtocol
  include Rotocol::Instruction

  optional :method_1
end

describe Rotocol::Instruction do
  context "no methods present" do
    it "has no required methods with it" do
      AProtocol.required_methods.should have(0).items
    end

    it "has no optional methods with it" do
      AProtocol.optional_methods.should have(0).items
    end
  end

  context "required methods present" do
    it "has required methods with it" do
      BProtocol.required_methods.should have(3).items
    end
  end

  context "optional methods present" do
    it "has optional methods with it" do
      CProtocol.optional_methods.should have(1).items
    end
  end
end

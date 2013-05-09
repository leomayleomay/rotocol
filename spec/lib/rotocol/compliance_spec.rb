require 'spec_helper'
require File.expand_path('../../../../lib/rotocol/instruction.rb', __FILE__)
require File.expand_path('../../../../lib/rotocol/compliance.rb', __FILE__)

describe Rotocol::Compliance do
  context "no methods present" do
    class AProtocol
      include Rotocol::Instruction
    end

    class BProtocol
      include Rotocol::Instruction
    end

    class Foo
      include Rotocol::Compliance

      comply_to :a_protocol
    end

    class Bar
      include Rotocol::Compliance

      comply_to :a_protocol, :b_protocol
    end

    context "comply to 1 protocol" do
      it "has no required methods with it" do
        Foo.required_methods[:a_protocol].should have(0).items
      end

      it "has no optional methods with it" do
        Foo.optional_methods[:a_protocol].should have(0).items
      end
    end

    context "comply to 1+ protocols" do
      it "has no required methods with it" do
        [:a_protocol, :b_protocol].each do |protocol|
          Bar.required_methods[protocol].should have(0).items
        end
      end

      it "has no optional methods with it" do
        [:a_protocol, :b_protocol].each do |protocol|
          Bar.optional_methods[protocol].should have(0).items
        end
      end
    end
  end

  context "required methods present" do
    class CProtocol
      include Rotocol::Instruction

      required :method_1, :method_2, :method_3
    end

    class DProtocol
      include Rotocol::Instruction

      required :method_1, :method_2, :method_3
    end

    class Foo
      include Rotocol::Compliance

      comply_to :c_protocol
    end

    class Bar
      include Rotocol::Compliance

      comply_to :c_protocol, :d_protocol
    end

    context "comply to 1 protocol" do
      it "has required methods with it" do
        Foo.required_methods[:c_protocol].should have(3).items
      end

      it "has no optional methods with it" do
        Foo.optional_methods[:c_protocol].should have(0).items
      end
    end

    context "comply to 1+ protocols" do
      it "has required methods with it" do
        [:c_protocol, :d_protocol].each do |protocol|
          Bar.required_methods[protocol].should have(3).items
        end
      end

      it "has no optional methods with it" do
        [:c_protocol, :d_protocol].each do |protocol|
          Bar.optional_methods[protocol].should have(0).items
        end
      end
    end
  end

  context "optional methods present" do
    class EProtocol
      include Rotocol::Instruction

      optional :method_1
    end

    class FProtocol
      include Rotocol::Instruction

      optional :method_1
    end

    class Foo
      include Rotocol::Compliance

      comply_to :e_protocol
    end

    class Bar
      include Rotocol::Compliance

      comply_to :e_protocol, :f_protocol
    end

    context "comply to 1 protocol" do
      it "has no required methods with it" do
        Foo.required_methods[:e_protocol].should have(0).items
      end

      it "has optional methods with it" do
        Foo.optional_methods[:e_protocol].should have(1).items
      end
    end

    context "comply to 1+ protocols" do
      it "has no required methods with it" do
        [:e_protocol, :f_protocol].each do |protocol|
          Bar.required_methods[protocol].should have(0).items
        end
      end

      it "has optional methods with it" do
        [:e_protocol, :f_protocol].each do |protocol|
          Bar.optional_methods[protocol].should have(1).items
        end
      end
    end
  end
end

require "spec_helper"

describe "Factories" do
  FactoryBot.factories.map(&:name).each do |factory_name|
    describe "#{factory_name} factory" do
      it "creates valid instance of #{factory_name.to_s.classify}" do
        expect(create(factory_name)).to be_valid
      end

      FactoryBot.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
        context "with trait #{trait_name}" do
          it "is valid instance of #{factory_name.to_s.classify}" do
            expect(create(factory_name, trait_name)).to be_valid
          end
        end
      end
    end
  end
end
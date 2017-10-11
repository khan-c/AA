require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Beckmanns') }
  subject(:pie) { Dessert.new('pie', 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq('pie')
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('pie', 'five', 'beckmanns') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients).to_not include('apples')
      pie.add_ingredient('apples')
      expect(pie.ingredients).to include('apples')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['butter', 'flour', 'water', 'sugar', 'salt']

      ingredients.each { |ing| pie.add_ingredient(ing) }

      expect(pie.ingredients).to eq(ingredients)
      expect(pie.mix!).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(2)
      expect(pie.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pie.eat(6) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Beckmanns the Great Baker")
      expect(pie.serve).to eq("Chef Beckmanns the Great Baker has made 5 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end

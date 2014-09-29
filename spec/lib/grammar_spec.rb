require 'spec_helper'

describe Grammar do

  describe "#to_phrase(list)" do
    let(:dinosaurs) { ['stegosaurus', 'triceratops', 'spinosaurus', 'iguanodon'] }
    it "returns a string" do
      expect(Grammar.to_phrase(dinosaurs).class).to eq String
    end

    it "separates lists > 2 by commas, +/- oxford comma" do
      expect(Grammar.to_phrase(dinosaurs).count(',')).to eq 3
      expect(Grammar.to_phrase(dinosaurs, oxford: false).count(',')).to eq 2
    end

    it "can be passed a separator" do
      expect(Grammar.to_phrase(dinosaurs)).to include(" and ")
      expect(Grammar.to_phrase(dinosaurs, separator: "or")).to include(" or ")
    end

    it "separates list of length 2 without commas" do
      expect(Grammar.to_phrase(dinosaurs[0,2])).not_to include(",")
    end

    it "returns single entry with no extraneous crap for list of length 1" do
      expect(Grammar.to_phrase(dinosaurs[0,1])).not_to include(" ")
    end
  end

  describe "#add_article(word)" do
    it "adds 'a' to word starting with consonant" do
      expect(Grammar.add_article('triceratops')).to start_with "a "
    end

    it "adds 'an' to word starting with vowel" do
      expect(Grammar.add_article('iguanadon')).to start_with "an "
    end

    it "adds definite article if specified" do
      expect(Grammar.add_article('iguanodon', definite: true)).to start_with "the "
    end

    it "adds 'some' if plural" do
      expect(Grammar.add_article('iguanodons', plural: true)).to start_with "some "
    end
  end

  describe "plural?(word)" do
    it "returns true if word ends in s, otherwise false" do
      expect(Grammar.is_plural?('iguanodon')).to eq false
      expect(Grammar.is_plural?('iguanodons')).to eq true
    end

    it "doesn't understand dinosaurs" do
      expect(Grammar.is_plural?('triceratops')).to eq true
    end
  end

end

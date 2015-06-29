require 'spec_helper'

describe Poker::Hand do
  it 'generates cards properly' do
    cards = subject.check([0, 1, 2, 3, 4])
    expect(cards).not_to be_nil
  end

  it "detects straight_flush" do
    #karty po kolei
    subject.check([0, 4, 8, 12, 16]).should == 9
    subject.check([5, 9, 13, 17, 21]).should == 9
    subject.check([10, 14, 18, 22, 26]).should == 9
    subject.check([15, 19, 23, 27, 31]).should == 9
    subject.check([16, 20, 24, 28, 32]).should == 9

    #karty zrandomizowane
    subject.check([37, 29, 33, 21, 25].shuffle).should == 9
    subject.check([30, 34, 38, 26, 42].shuffle).should == 9
    subject.check([31, 35, 47, 43, 39].shuffle).should == 9
    subject.check([32, 48, 40, 44, 36].shuffle).should == 9
    subject.check([49, 45, 41, 37, 33].shuffle).should == 9
  end

  it "detects four_of_a_kind" do
    #karty po kolei
    subject.check([0, 1, 2, 3, 4]).should == 8
    subject.check([4, 5, 6, 0, 7]).should == 8
    subject.check([8, 9, 0, 10, 11]).should == 8
    subject.check([12, 0, 13, 14, 15]).should == 8
    subject.check([0, 16, 17, 18, 19]).should == 8

    #karty zrandomizowane
    subject.check([20, 21, 22, 23, 0].shuffle).should == 8
    subject.check([24, 25, 26, 27, 0].shuffle).should == 8
    subject.check([28, 29, 30, 31, 0].shuffle).should == 8
    subject.check([32, 33, 34, 35, 0].shuffle).should == 8
    subject.check([36, 37, 38, 39, 0].shuffle).should == 8
  end

  it "detects full_house" do
    #karty po kolei
    subject.check([1, 2, 3, 4, 5]).should == 7
    subject.check([5, 6, 7, 8, 9]).should == 7
    subject.check([9, 10, 11, 12, 13]).should == 7
    subject.check([13, 14, 15, 16, 17]).should == 7
    subject.check([17, 18, 19, 20, 21]).should == 7

    #karty zrandomizowane
    subject.check([21, 22, 23, 24, 25].shuffle).should == 7
    subject.check([25, 26, 27, 28, 29].shuffle).should == 7
    subject.check([30, 31, 32, 33, 34].shuffle).should == 7
    subject.check([34, 35, 36, 37, 38].shuffle).should == 7
    subject.check([38, 39, 40, 41, 42].shuffle).should == 7
  end

  it "detects flush" do
    #karty po kolei
    subject.check([0, 4, 8, 12, 20]).should == 6
    subject.check([5, 9, 13, 17, 25]).should == 6
    subject.check([10, 14, 18, 22, 30]).should == 6
    subject.check([15, 19, 23, 27, 35]).should == 6
    subject.check([16, 20, 24, 28, 36]).should == 6

    #karty zrandomizowane
    subject.check([21, 25, 29, 33, 41].shuffle).should == 6
    subject.check([26, 30, 2, 6, 14].shuffle).should == 6
    subject.check([3, 7, 15, 51, 39].shuffle).should == 6
    subject.check([2, 50, 22, 30, 10].shuffle).should == 6
    subject.check([49, 41, 29, 17, 13].shuffle).should == 6
  end

  it "detects straight" do
    #karty po kolei
    subject.check([0, 5, 10, 15, 18]).should == 5
    subject.check([4, 9, 14, 19, 22]).should == 5
    subject.check([8, 13, 18, 23, 26]).should == 5
    subject.check([12, 17, 22, 27, 30]).should == 5
    subject.check([16, 21, 26, 31, 34]).should == 5

    #karty zrandomizowane
    subject.check([49, 46, 43, 38, 33].shuffle).should == 5
    subject.check([45, 42, 39, 34, 29].shuffle).should == 5
    subject.check([41, 38, 35, 30, 25].shuffle).should == 5
    subject.check([37, 34, 31, 26, 21].shuffle).should == 5
    subject.check([34, 31, 26, 21, 16].shuffle).should == 5
  end

  it "detects three_of_a_kind" do
    #karty po kolei
    subject.check([0, 1, 2, 4, 8]).should == 4
    subject.check([4, 5, 6, 8, 12]).should == 4
    subject.check([8, 9, 10, 12, 16]).should == 4
    subject.check([12, 13, 14, 16, 20]).should == 4
    subject.check([16, 17, 18, 20, 24]).should == 4

    #karty zrandomizowane
    subject.check([20, 21, 22, 24, 28].shuffle).should == 4
    subject.check([24, 25, 26, 28, 32].shuffle).should == 4
    subject.check([28, 29, 30, 32, 37].shuffle).should == 4
    subject.check([32, 33, 34, 0, 4].shuffle).should == 4
    subject.check([51, 50, 49, 0, 14].shuffle).should == 4
  end

  it "detects two_pair" do
    #karty po kolei
    subject.check([0, 1, 4, 5, 8]).should == 3
    subject.check([4, 5, 8, 9, 12]).should == 3
    subject.check([8, 9, 12, 13, 16]).should == 3
    subject.check([12, 13, 16, 17, 20]).should == 3
    subject.check([16, 17, 20, 21, 24]).should == 3

    #karty zrandomizowane
    subject.check([20, 21, 24, 25, 28].shuffle).should == 3
    subject.check([24, 25, 28, 29, 32].shuffle).should == 3
    subject.check([28, 29, 32, 33, 37].shuffle).should == 3
    subject.check([32, 33, 36, 37, 40].shuffle).should == 3
    subject.check([36, 37, 40, 41, 44].shuffle).should == 3
  end

  it "detects pair" do
    #karty po kolei
    subject.check([0, 7, 8, 36, 37]).should == 2
    subject.check([0, 40, 41, 44, 48]).should == 2
    subject.check([0, 8, 12, 44, 45]).should == 2
    subject.check([1, 9, 13, 48, 50]).should == 2
    subject.check([7, 19, 22, 38, 39]).should == 2

    #karty zrandomizowane
    subject.check([46, 47, 51, 43, 0].shuffle).should == 2
    subject.check([46, 44, 16, 48, 0].shuffle).should == 2
    subject.check([49, 50, 0, 7, 9].shuffle).should == 2
    subject.check([37, 39, 1, 13, 21].shuffle).should == 2
    subject.check([48, 49, 0, 39, 18].shuffle).should == 2
  end

  it "detects high_card" do
    #karty po kolei
    subject.check([0, 7, 8, 12, 37]).should == 1
    subject.check([0, 40, 19, 44, 48]).should == 1
    subject.check([0, 8, 12, 19, 45]).should == 1
    subject.check([1, 9, 13, 19, 50]).should == 1
    subject.check([7, 19, 22, 1, 39]).should == 1

    #karty zrandomizowane
    subject.check([46, 21, 51, 43, 0].shuffle).should == 1
    subject.check([46, 21, 16, 48, 0].shuffle).should == 1
    subject.check([49, 21, 0, 7, 9].shuffle).should == 1
    subject.check([2, 39, 29, 13, 21].shuffle).should == 1
    subject.check([48, 21, 0, 39, 18].shuffle).should == 1
  end

  it "detects nothing" do
    #karty po kolei
    subject.check([0, 10, 18, 24, 34]).should == 0
    subject.check([4, 24, 22, 28, 8]).should == 0
    subject.check([8, 28, 26, 32, 2]).should == 0
    subject.check([12, 32, 19, 6, 1]).should == 0
    subject.check([16, 29, 34, 0, 9]).should == 0

    #karty zrandomizowane
    subject.check([0, 10, 18, 24, 34].shuffle).should == 0
    subject.check([4, 24, 22, 28, 8].shuffle).should == 0
    subject.check([8, 28, 26, 32, 2].shuffle).should == 0
    subject.check([12, 0, 19, 34, 6].shuffle).should == 0
    subject.check([16, 0, 34, 20, 9].shuffle).should == 0
  end
end
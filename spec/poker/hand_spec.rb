require 'spec_helper'

describe Poker::Hand do
  it 'generates cards properly' do
    cards = subject.check([0, 1, 2, 3, 4])
    expect(cards).not_to be_nil
  end

  it 'detects straight_flush' do
    #karty po kolei
    expect(subject.check([0, 4, 8, 12, 16])).to eq(9)
    expect(subject.check([5, 9, 13, 17, 21])).to eq(9)
    expect(subject.check([10, 14, 18, 22, 26])).to eq(9)
    expect(subject.check([15, 19, 23, 27, 31])).to eq(9)
    expect(subject.check([16, 20, 24, 28, 32])).to eq(9)

    #karty zrandomizowane
    expect(subject.check([37, 29, 33, 21, 25].shuffle)).to eq(9)
    expect(subject.check([30, 34, 38, 26, 42].shuffle)).to eq(9)
    expect(subject.check([31, 35, 47, 43, 39].shuffle)).to eq(9)
    expect(subject.check([32, 48, 40, 44, 36].shuffle)).to eq(9)
    expect(subject.check([49, 45, 41, 37, 33].shuffle)).to eq(9)
  end

  it 'detects four_of_a_kind' do
    #karty po kolei
    expect(subject.check([0, 1, 2, 3, 4])).to eq(8)
    expect(subject.check([4, 5, 6, 0, 7])).to eq(8)
    expect(subject.check([8, 9, 0, 10, 11])).to eq(8)
    expect(subject.check([12, 0, 13, 14, 15])).to eq(8)
    expect(subject.check([0, 16, 17, 18, 19])).to eq(8)

    #karty zrandomizowane
    expect(subject.check([20, 21, 22, 23, 0].shuffle)).to eq(8)
    expect(subject.check([24, 25, 26, 27, 0].shuffle)).to eq(8)
    expect(subject.check([28, 29, 30, 31, 0].shuffle)).to eq(8)
    expect(subject.check([32, 33, 34, 35, 0].shuffle)).to eq(8)
    expect(subject.check([36, 37, 38, 39, 0].shuffle)).to eq(8)
  end

  it 'detects full_house' do
    #karty po kolei
    expect(subject.check([1, 2, 3, 4, 5])).to eq(7)
    expect(subject.check([5, 6, 7, 8, 9])).to eq(7)
    expect(subject.check([9, 10, 11, 12, 13])).to eq(7)
    expect(subject.check([13, 14, 15, 16, 17])).to eq(7)
    expect(subject.check([17, 18, 19, 20, 21])).to eq(7)

    #karty zrandomizowane
    expect(subject.check([21, 22, 23, 24, 25].shuffle)).to eq(7)
    expect(subject.check([25, 26, 27, 28, 29].shuffle)).to eq(7)
    expect(subject.check([30, 31, 32, 33, 34].shuffle)).to eq(7)
    expect(subject.check([34, 35, 36, 37, 38].shuffle)).to eq(7)
    expect(subject.check([38, 39, 40, 41, 42].shuffle)).to eq(7)
  end

  it 'detects flush' do
    #karty po kolei
    expect(subject.check([0, 4, 8, 12, 20])).to eq(6)
    expect(subject.check([5, 9, 13, 17, 25])).to eq(6)
    expect(subject.check([10, 14, 18, 22, 30])).to eq(6)
    expect(subject.check([15, 19, 23, 27, 35])).to eq(6)
    expect(subject.check([16, 20, 24, 28, 36])).to eq(6)

    #karty zrandomizowane
    expect(subject.check([21, 25, 29, 33, 41].shuffle)).to eq(6)
    expect(subject.check([26, 30, 2, 6, 14].shuffle)).to eq(6)
    expect(subject.check([3, 7, 15, 51, 39].shuffle)).to eq(6)
    expect(subject.check([2, 50, 22, 30, 10].shuffle)).to eq(6)
    expect(subject.check([49, 41, 29, 17, 13].shuffle)).to eq(6)
  end

  it 'detects straight' do
    #karty po kolei
    expect(subject.check([0, 5, 10, 15, 18])).to eq(5)
    expect(subject.check([4, 9, 14, 19, 22])).to eq(5)
    expect(subject.check([8, 13, 18, 23, 26])).to eq(5)
    expect(subject.check([12, 17, 22, 27, 30])).to eq(5)
    expect(subject.check([16, 21, 26, 31, 34])).to eq(5)

    #karty zrandomizowane
    expect(subject.check([49, 46, 43, 38, 33].shuffle)).to eq(5)
    expect(subject.check([45, 42, 39, 34, 29].shuffle)).to eq(5)
    expect(subject.check([41, 38, 35, 30, 25].shuffle)).to eq(5)
    expect(subject.check([37, 34, 31, 26, 21].shuffle)).to eq(5)
    expect(subject.check([34, 31, 26, 21, 16].shuffle)).to eq(5)
  end

  it 'detects three_of_a_kind' do
    #karty po kolei
    expect(subject.check([0, 1, 2, 4, 8])).to eq(4)
    expect(subject.check([4, 5, 6, 8, 12])).to eq(4)
    expect(subject.check([8, 9, 10, 12, 16])).to eq(4)
    expect(subject.check([12, 13, 14, 16, 20])).to eq(4)
    expect(subject.check([16, 17, 18, 20, 24])).to eq(4)

    #karty zrandomizowane
    expect(subject.check([20, 21, 22, 24, 28].shuffle)).to eq(4)
    expect(subject.check([24, 25, 26, 28, 32].shuffle)).to eq(4)
    expect(subject.check([28, 29, 30, 32, 37].shuffle)).to eq(4)
    expect(subject.check([32, 33, 34, 0, 4].shuffle)).to eq(4)
    expect(subject.check([51, 50, 49, 0, 14].shuffle)).to eq(4)
  end

  it 'detects two_pair' do
    #karty po kolei
    expect(subject.check([0, 1, 4, 5, 8])).to eq(3)
    expect(subject.check([4, 5, 8, 9, 12])).to eq(3)
    expect(subject.check([8, 9, 12, 13, 16])).to eq(3)
    expect(subject.check([12, 13, 16, 17, 20])).to eq(3)
    expect(subject.check([16, 17, 20, 21, 24])).to eq(3)

    #karty zrandomizowane
    expect(subject.check([20, 21, 24, 25, 28].shuffle)).to eq(3)
    expect(subject.check([24, 25, 28, 29, 32].shuffle)).to eq(3)
    expect(subject.check([28, 29, 32, 33, 37].shuffle)).to eq(3)
    expect(subject.check([32, 33, 36, 37, 40].shuffle)).to eq(3)
    expect(subject.check([36, 37, 40, 41, 44].shuffle)).to eq(3)
  end

  it 'detects pair' do
    #karty po kolei
    expect(subject.check([0, 7, 8, 36, 37])).to eq(2)
    expect(subject.check([0, 40, 41, 44, 48])).to eq(2)
    expect(subject.check([0, 8, 12, 44, 45])).to eq(2)
    expect(subject.check([1, 9, 13, 48, 50])).to eq(2)
    expect(subject.check([7, 19, 22, 38, 39])).to eq(2)

    #karty zrandomizowane
    expect(subject.check([46, 47, 51, 43, 0].shuffle)).to eq(2)
    expect(subject.check([46, 44, 16, 48, 0].shuffle)).to eq(2)
    expect(subject.check([49, 50, 0, 7, 9].shuffle)).to eq(2)
    expect(subject.check([37, 39, 1, 13, 21].shuffle)).to eq(2)
    expect(subject.check([48, 49, 0, 39, 18].shuffle)).to eq(2)
  end

  it 'detects high_card' do
    #karty po kolei
    expect(subject.check([0, 7, 8, 12, 37])).to eq(1)
    expect(subject.check([0, 40, 19, 44, 48])).to eq(1)
    expect(subject.check([0, 8, 12, 19, 45])).to eq(1)
    expect(subject.check([1, 9, 13, 19, 50])).to eq(1)
    expect(subject.check([7, 19, 22, 1, 39])).to eq(1)

    #karty zrandomizowane
    expect(subject.check([46, 21, 51, 43, 0].shuffle)).to eq(1)
    expect(subject.check([46, 21, 16, 48, 0].shuffle)).to eq(1)
    expect(subject.check([49, 21, 0, 7, 9].shuffle)).to eq(1)
    expect(subject.check([2, 39, 29, 13, 21].shuffle)).to eq(1)
    expect(subject.check([48, 21, 0, 39, 18].shuffle)).to eq(1)
  end

  it 'detects nothing' do
    #karty po kolei
    expect(subject.check([0, 10, 18, 24, 34])).to eq(0)
    expect(subject.check([4, 24, 22, 28, 8])).to eq(0)
    expect(subject.check([8, 28, 26, 32, 2])).to eq(0)
    expect(subject.check([12, 32, 19, 6, 1])).to eq(0)
    expect(subject.check([16, 29, 34, 0, 9])).to eq(0)

    #karty zrandomizowane
    expect(subject.check([0, 10, 18, 24, 34].shuffle)).to eq(0)
    expect(subject.check([4, 24, 22, 28, 8].shuffle)).to eq(0)
    expect(subject.check([8, 28, 26, 32, 2].shuffle)).to eq(0)
    expect(subject.check([12, 0, 19, 34, 6].shuffle)).to eq(0)
    expect(subject.check([16, 0, 34, 20, 9].shuffle)).to eq(0)
  end
end

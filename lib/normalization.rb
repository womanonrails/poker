class Normalization
  attr_reader :figures, :colors, :figures_frequency

  def initialize(array)
    @array = array.sort
    @figures = preapre_figures
    @colors = prepare_colors
    @figures_frequency = prepare_figures_frequency.values
  end

  private

  def prepare_colors
    @array
  end

  def preapre_figures
    @array
  end

  def prepare_figures_frequency
    @figures.each_with_object(Hash.new(0)) do |item, hash|
      hash[item] += 1
    end
  end
end

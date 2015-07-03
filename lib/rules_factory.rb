class RulesFactory
  def initialize(*rules)
    @rules = rules
  end

  def check?
    @rules.each do |rule|
      return false unless rule.check?
    end
    true
  end
end

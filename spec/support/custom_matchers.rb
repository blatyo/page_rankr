RSpec::Matchers.define :be_in do |expected|
  match do |actual|
    expected === actual
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be in #{expected}"
  end
end

RSpec::Matchers.define :be_number do
  match do |actual|
    actual.is_a?(Numeric) && actual.send(@symbol, @expected)
  end

  chain :>= do |expected|
    @symbol = :>=
    @expected = expected
  end

  chain :> do |expected|
    @symbol = :>
    @expected = expected
  end

  chain :< do |expected|
    @symbol = :<
    @expected = expected
  end

  chain :<= do |expected|
    @symbol = :<=
    @expected = expected
  end

  failure_message do |actual|
    "expected that #{actual.inspect} would be a number and #{@symbol} than #{@expected}"
  end
end

dictionory=["below", "down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
  return {} if word.nil? || dictionary.nil?

  downcased = word.downcase
  dictionary.each_with_object({}) do |substr, result|
    next if substr.nil? || substr.empty?

    # escape to treat special chars literally, use lookahead to count overlapping matches
    pattern = Regexp.escape(substr.downcase)
    count = downcased.scan(/(?=#{pattern})/).length

    result[substr] = count if count > 0
  end
end

dict = %w[below low be]
p substrings("below", dict)
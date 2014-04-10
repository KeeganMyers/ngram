require '~/Projects/ngram/corpus'
require '~/Projects/ngram/brownCorpusFile'
Dir.chdir(File.dirname(__FILE__))
corpus = Corpus.new('brown/c*', BrownCorpusFile)
capitals = ('A'..'Z')
results = Hash.new(0)

corpus.trigrams.each do |trigram|
  if trigram.first == "of" && capitals.include?(trigram[1].chars.first)
    result = [trigram[1]]

    if capitals.include?(trigram[2].chars.first)
      result << trigram[2]
    end

     results[result.join(' ')] += 1

  end
end

puts results.sort_by { |k, v| v }.inspect

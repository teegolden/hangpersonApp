class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_reader:word,:guesses,:wrong_guesses,:win,:loss
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  def initialize(word)
    @word = word
    @guesses =''
    @wrong_guesses = ''
    @dict = {}
    @word.each_char do |w| 
      @dict[w] = w
    end

  end

  def guess(w)
    if !w.match(/^[[:alpha:]]$/)
      raise ArgumentError
    end

    if @dict.has_key?(w)
      @guesses += w
      @dict.delete(w)
      @win = @dict.empty?
      true
    else
      @wrong_guesses+=w
      @loss =@wrong_guesses.length >= @word.length
      false
    end
  end



  


end

require "iglatinpay/version"

class Iglatinpay

  # For words that begin with consonant sounds, the initial consonant or consonant cluster is moved to the end of the word, 
  # and "ay" is added, as in the following examples:
  #   "happy" → "appyhay"
  #   "duck" → "uckday"
  #   "glove" → "oveglay"

  # In the case of a word having two or more of the same letters after the first letter, 
  # we take out one of the same letters. Examples are:
  #   "egg" → "geway"

  # For words that begin with vowel sounds or silent letter, 
  # "way" is added at the end of the word. Examples are:
  #   "egg" → "geway"
  #   "inbox" → "nboxiway"
  #   "eight" → "ighteway"

  LETTERS = ('a'..'z').to_a
  VOWELS = %w{ a e i o u y }
  CONSONANTS = LETTERS - VOWELS

  def initialize(input)
    @input = input.downcase.scan(/[a-z]+/i)
  end

  def translate
    # If starts with consonants
    @input.map { |w| reorganize(w) }.join(" ")
  end

  private

  def reorganize(w)
    w = remove_consecutive(w.split(//))
    if VOWELS.include?(w.first)
      reorganize_vowel_start(w) 
    else
      reorganize_consonant_start(w)
    end
  end

  def reorganize_vowel_start(w)
    w.rotate(1).join << "way"
  end

  def reorganize_consonant_start(w)
    w.rotate(1).join << "ay"
  end

  def remove_consecutive(w)
    if w[1] == w[2]
      w.delete_at(2)
    end
    w
  end

end


String.class_eval do

  def to_piglatin
    Iglatinpay.new(self).translate
  end

end
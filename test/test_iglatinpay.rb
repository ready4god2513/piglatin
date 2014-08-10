require_relative "../lib/iglatinpay.rb"
require "minitest/autorun"

class TestIglatinpay < Minitest::Test

  def test_to_piglatin_converts
    assert_equal("appyhay", "happy".to_piglatin)
  end

  def test_begin_consonants
    assert_equal("appyhay", Iglatinpay.new("happy").translate)
  end

  def test_remove_consecutive
    assert_equal("geway", Iglatinpay.new("egg").translate)
  end

  def test_begin_vowel
    assert_equal("nboxiway", Iglatinpay.new("inbox").translate)
  end

end
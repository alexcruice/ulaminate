require "ulaminate/version"
require "ulam_sequence"

module Ulaminate
  def self.ulam_sequence(size)
    UlamSequence.new(size).each
  end
end

class Game < ActiveRecord::Base
  def to_s
    "#{title} (#{genre})"
  end
end

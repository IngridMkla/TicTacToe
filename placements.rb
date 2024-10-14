module Placements

  def is_position(position)
    position.strip!
    return false unless position.length == 2

    row = position[0]
    row.upcase!
    return false unless ("A".."C").include?(row)

    column = position[1]
    return false unless ("0".."2").include?(column)

    return true
  end

  def position_to_coordinates(pos)
    pos.strip!
    x = pos[0]
    y = pos[1].to_I

    case y
    when "A"
      y = 0
    when "B"
      y = 1
    when "C"
      y = 2
    end
    return x,y
  end

  def coordinates_to_position(x,y)
    col = x.to_S

    case y
      when 0
        y = "A"
      when 1
        y = "B"
      when 2
        y = "C"
    end
    pos = y + x
    return pos
  end

end

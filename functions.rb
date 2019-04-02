# coding: utf-8
# 迷路作成(top:1, right:2, bottom:3, left:4)
# WALL=0, FLOOR=1, LUCKY_ON_FLOOR = 3
WALL = 0
FLOOR = 1
LUCKY_ON_FLOOR = 2

WIDTH = 31
HEIGHT = 21

def setLucky(a_array, a_width, a_height)
  loop do
    lucky_position = rand(0..(a_width*a_height - 1))
    if FLOOR == a_array[lucky_position] then
      a_array[lucky_position] = LUCKY_ON_FLOOR
      break
    end
  end
end

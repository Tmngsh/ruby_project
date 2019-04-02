# coding: utf-8
require 'dxruby'
include 'functions'

image = Image.load('resources/images/lucky.png')
image_tree = Image.load('resources/images/tree_with_background.png')

scale = 1;


a = Array.new(WIDTH*HEIGHT)

for i in 0 .. HEIGHT - 1 do
  for j in 0 .. WIDTH - 1 do
    if (i%2 == 1) && (j%2 == 1) then
      a[i*WIDTH + j] = WALL
    else
      a[i*WIDTH + j] = FLOOR
    end
  end
end

#迷路自動作成
#一段目
i = 1
for j in 0 .. WIDTH - 1 do
  if j%2 == 1 then
    loop do
      rand_num = rand(1..4)
      if rand_num == 1 then # 下
        if a[(i-1)*WIDTH + j] != WALL then
          a[(i-1)*WIDTH + j] = WALL
          break
        end
      elsif rand_num == 2 then # 右
        if a[i*WIDTH + j+1] != WALL then
          a[i*WIDTH + j+1] = WALL
          break
        end
      elsif rand_num == 3 then # 下
        if a[(i+1)*WIDTH + j] != WALL then
          a[(i+1)*WIDTH + j] = WALL
          break
        end
      else # 左
        if a[i*WIDTH + j-1] != WALL then
          a[i*WIDTH + j-1] = WALL
          break
        end
      end
    end
  end
end

#2段目以降
for i in 1 .. HEIGHT - 1 do
  if i%2 == 1 then
    for j in 0 .. WIDTH - 1 do
      if j%2 == 1 then
        loop do
          rand_num = rand(2..4)
          print rand_num, "\n"
          if rand_num == 2 then # 右
            if a[i*WIDTH + j+1] != WALL then
              a[i*WIDTH + j+1] = WALL
              break
            end
          elsif rand_num == 3 then # 下
            if a[(i+1)*WIDTH + j] != WALL then
              a[(i+1)*WIDTH + j] = WALL
              break
            end
          else # 左
            if a[i*WIDTH + j-1] != WALL then
              a[i*WIDTH + j-1] = WALL
              break
            end
          end
        end
      end
    end
  end
end

# ラッキーの位置を決定する
setLucky(a)


Window.loop do
  for i in 0 .. HEIGHT - 1 do
    for j in 0 .. WIDTH - 1do
      if a[i*WIDTH + j] == WALL then
        Window.draw(j * 20, i * 20, image_tree);
      elsif a[i*WIDTH+j] == LUCKY_ON_FLOOR then
        Window.draw(j * 20, i * 20, image)
      end
    end
  end
  if Input.key_down?(K_A) then
    Window.draw(20, 20, image)
  else
    Window.draw(0, 0, image)
    scale = 1;
  end
end



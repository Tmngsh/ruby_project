require 'dxruby'

image = Image.load('resources/images/lucky.png')

Window.loop do
  if Input.key_down?(K_A) then
    Window.draw_scale(100, 100, image, 4, 4)
  else
    Window.draw_scale(0, 0, image, 4, 4)
  end
end


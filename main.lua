function love.load()
  settings = {}
  settings.width = 1024
  settings.height = 600
  settings.gravity = {x = 0, y = 700}
  settings.meter = 64
  settings.num_stars = 20
  settings.title = 'asteroids'
  settings.bg_color = {r = 0, g = 0, b = 0}
  
  world = love.physics.newWorld(0, 0, settings.width, settings.height)
  world:setGravity(settings.gravity.x, settings.gravity.y)
  world:setMeter(settings.meter)
  
  objects = {}
  objects.stars = {}
  
  for i = 1, settings.num_stars do
    star = {}
    star.width = 2
    star.height = 2
    star.x1 = math.random(1, settings.width - star.width)
    star.y1 = math.random(1, settings.height - star.height)
    star.x2 = star.x1 + 2
    star.y2 = star.y1
    star.x3 = star.x1 + 2
    star.y3 = star.y1 + 2
    star.x4 = star.x1
    star.y4 = star.y1 + 2
    objects.stars[i] = star
  end
  
  love.graphics.setBackgroundColor(settings.bg_color.r, settings.bg_color.g, settings.bg_color.b)
  love.graphics.setMode(settings.width, settings.height, false, true, 0)
  love.graphics.setCaption(settings.title)
end


function love.update(dt)
  world:update(dt)
end

function love.draw()
  for i = 1, settings.num_stars do
    star = objects.stars[i]
    love.graphics.quad('fill', star.x1, star.y1, star.x2, star.y2, star.x3, star.y3, star.x4, star.y4)
  end
end

settings = require('settings')

local space = {}

space.world = love.physics.newWorld(0, 0, settings.width, settings.height)
space.stars = {}

function space.load()
  space.world:setGravity(settings.gravity.x, settings.gravity.y)
  space.world:setMeter(settings.meter)
  space.loadBackground()
  space.loadStars()
end

function space.draw()
  for i = 1, settings.numStars do
    space.drawStar(space.stars[i])
  end
end

function space.loadBackground()
  love.graphics.setBackgroundColor(settings.bgColor.r, settings.bgColor.g, settings.bgColor.b)
  love.graphics.setMode(settings.width, settings.height, false, true, 0)
  love.graphics.setCaption(settings.title)
end

function space.loadStars()
  space.stars = {}
  for i = 1, settings.numStars do
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
    space.stars[i] = star
  end
end

function space.drawStar(star)
  love.graphics.quad('fill', star.x1, star.y1, star.x2, star.y2, star.x3, star.y3, star.x4, star.y4)
end

return space

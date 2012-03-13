settings = require('settings')
util     = require('util')

local space = {}

space.world = love.physics.newWorld(0, 0, settings.width, settings.height)
space.stars = {}
space.starSpeedSlow = 15
space.starSpeedFast = space.starSpeedSlow * 2

function space.getStarSpeed(i)
  if i < (settings.numStars / 2) then
    return space.starSpeedSlow
  else
    return space.starSpeedFast
  end
end

function space.load()
  space.world:setGravity(settings.gravity.x, settings.gravity.y)
  space.world:setMeter(settings.meter)
  space.loadBackground()
  space.loadStars()
end

function space.update(dt)
  space.world:update(dt)
  space.updateStars(dt)
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
    star.speed = space.getStarSpeed(i)
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

function space.updateStars(dt)
  for i = 1, settings.numStars do
    space.updateStar(space.stars[i], dt)
  end
end

function space.updateStar(star, dt)
  offset  = star.speed * dt
  star.x1 = star.x1 + offset
  star.x2 = star.x2 + offset
  star.x3 = star.x3 + offset
  star.x4 = star.x3 + offset
  if util.quadOutOfBounds(star) then
    util.wrapQuadHorizontal(star)
  end
end

function space.drawStar(star)
  love.graphics.quad('fill', star.x1, star.y1, star.x2, star.y2, star.x3, star.y3, star.x4, star.y4)
end

return space

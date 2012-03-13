local ship  = require('ship')
local space = require('space')

function love.load()
  space.load()
  ship.load()
end


function love.update(dt)
  space.update(dt)
  ship.update(dt)
end

function love.draw()
  space.draw()
  ship.draw()
end

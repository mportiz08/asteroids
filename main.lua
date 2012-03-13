local space = require('space')

function love.load()
  space.load()
end


function love.update(dt)
  space.world:update(dt)
end

function love.draw()
  space.draw()
end

local settings = require('settings')

local ship = {}

ship.width  = 10
ship.height = 20

function ship.load()
  center = {x = settings.width / 2, y = settings.height / 2}
  bottomLeft = {
    x = center.x - (ship.width / 2),
    y = center.y + (ship.height / 2)
  }
  bottomRight = {
    x = bottomLeft.x + ship.width,
    y = bottomLeft.y
  }
  top = {
    x = center.x,
    y = center.y - (ship.height / 2)
  }
  ship.vertices = {
    bottomLeft.x, bottomLeft.y,
    bottomRight.x, bottomRight.y,
    top.x, top.y
  }
end

function ship.update()
  -- TODO
end

function ship.draw()
  love.graphics.polygon('line', ship.vertices)
end

return ship

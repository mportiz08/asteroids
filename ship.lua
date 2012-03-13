local settings = require('settings')
local space    = require('space')

local ship = {}

ship.width  = 10
ship.height = 20
ship.color  = {r = 255, g = 255, b = 255}

function ship.load()
  center = {x = settings.width / 2, y = settings.height / 2}
  offsets = {
    top = {
      x = 0,
      y = 0 - (ship.height / 2)
    },
    bottomRight = {
      x = ship.width / 2,
      y = ship.height / 2
    },
    bottomLeft = {
      x = 0 - (ship.width / 2),
      y = ship.height / 2
    }
  }
  ship.body = love.physics.newBody(space.world, center.x, center.y, 15, 0)
  ship.shape = love.physics.newPolygonShape(ship.body, offsets.top.x, offsets.top.y,
                                            offsets.bottomRight.x, offsets.bottomRight.y,
                                            offsets.bottomLeft.x, offsets.bottomLeft.y)
end

function ship.update()
  -- TODO
end

function ship.draw()
  love.graphics.setColor(ship.color.r, ship.color.g, ship.color.b)
  love.graphics.polygon('line', ship.shape:getPoints())
end

return ship

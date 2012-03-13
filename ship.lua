local settings = require('settings')
local space    = require('space')

local ship = {}

ship.width              = 10
ship.height             = 20
ship.speed              = 60
ship.torque             = 100
ship.mass               = 15
ship.inertia            = 30
ship.maxAngularVelocity = 5
ship.maxLinearVelocity  = 50
ship.linearDamping      = 1
ship.angularDamping     = 1
ship.color              = {r = 255, g = 255, b = 255}

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
  ship.body = love.physics.newBody(space.world, center.x, center.y, ship.mass, ship.inertia)
  ship.shape = love.physics.newPolygonShape(ship.body, offsets.top.x, offsets.top.y,
                                            offsets.bottomRight.x, offsets.bottomRight.y,
                                            offsets.bottomLeft.x, offsets.bottomLeft.y)
  ship.body:setLinearDamping(ship.linearDamping)
  ship.body:setAngularDamping(ship.angularDamping)
end

function ship.update(dt)
  angle = ship.body:getAngle()
  if love.keyboard.isDown('left') then
    ship.body:applyTorque(0 - ship.torque)
  end
  if love.keyboard.isDown('right') then
    ship.body:applyTorque(ship.torque)
  end
  if love.keyboard.isDown('up') then
    ship.body:applyForce(ship.speed * math.sin(angle), 0 - (ship.speed * math.cos(angle)))
  end
end

function ship.draw()
  love.graphics.setColor(ship.color.r, ship.color.g, ship.color.b)
  love.graphics.polygon('line', ship.shape:getPoints())
end

return ship

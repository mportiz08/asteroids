local settings = require('settings')

local util = {}

function util.quadOutOfBounds(quad)
  return util.pointOutOfBounds(quad.x1, quad.y1) or
         util.pointOutOfBounds(quad.x2, quad.y2) or
         util.pointOutOfBounds(quad.x3, quad.y3) or 
         util.pointOutOfBounds(quad.x4, quad.y4)
end

function util.pointOutOfBounds(x, y)
  return (x < 0 or x > settings.width) or (y < 0 or y > settings.height)
end

function util.wrapQuadHorizontal(quad)
  if (quad.x1 < 0) or (quad.x2 < 0) or (quad.x3 < 0) or (quad.x4 < 0) then
    quad.x1 = settings.width
    quad.x2 = quad.x1 + quad.width
    quad.x3 = quad.x1 + quad.width
    quad.x4 = quad.x1
  end
  if (quad.x1 > settings.width) or (quad.x2 > settings.width) or (quad.x3 > settings.width) or (quad.x4 > settings.width) then
    quad.x1 = 0
    quad.x2 = quad.x1 + quad.width
    quad.x3 = quad.x1 + quad.width
    quad.x4 = quad.x1
  end
end

return util

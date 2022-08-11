Surfer = Class{}

function Surfer:init(x, y)
    self.x = x
    self.y = y
    self.dx = 0

    self.width = 13
    self.height = 13
end

function Surfer:collides(object)
    if self.x + self.width - 5 >= object.x and self.x + 5 <= object.x + object.width then
        if self.y + self.height - 2 >= object.y and self.y + 3 <= object.y + object.height then
            return true
        end
    end

    return false
end

function Surfer:update(dt)
    self.x = self.x + self.dx * dt

    if self.x + self.width <= 0 then self.x = VIRTUAL_WIDTH
    elseif self.x >= VIRTUAL_WIDTH then self.x = 0 - self.width end
end

function Surfer:render()
    love.graphics.draw(
        gTextures['surfer'],
        (self.dx/math.abs(self.dx)) == 1 and self.x-2 + self.width+2+2+1 or self.x-2,
        self.y-2,
        0,
        -(self.dx/math.abs(self.dx)),
        1
    )
end
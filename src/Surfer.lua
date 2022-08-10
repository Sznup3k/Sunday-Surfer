Surfer = Class{}

function Surfer:init(x, y)
    self.x = x
    self.y = y
    self.dx = 0

    self.width = 13
    self.height = 13
end

function Surfer:collides(object)
    if self.x + self.width >= object.x and self.x <= object.x + object.width then
        if self.y + self.height >= object.y and self.y <= object.y + object.height then
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
    love.graphics.draw(gTextures['surfer1'], self.x, self.y)
end
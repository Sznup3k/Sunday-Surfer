Surfer = Class{}

function Surfer:init(x, y)
    self.x = x
    self.y = y
    self.dx = 0
end

function Surfer:update(dt)
    self.x = self.x + self.dx * dt
end

function Surfer:render()
    love.graphics.draw(gTextures['surfer1'], self.x, self.y)
end
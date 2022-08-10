Rock = Class{}

function Rock:init(x, y)
    self.x = x
    self.y = y
    self.dy = -ROCK_SS

    self.width = 10
    self.height = 10

    self.remove = false
end

function Rock:update(dt)
    self.y = self.y + self.dy * dt

    if self.y <= 110 then
        self.remove = true
    end
end

function Rock:render()
    love.graphics.draw(gTextures['rock'], self.x, self.y)
end
PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Surfer(VIRTUAL_WIDTH/2-7, VIRTUAL_HEIGHT/2+5)
    self.player.dx = math.random(1, 2) == 1 and SURFER_SPEED or -SURFER_SPEED 

    self.rocks = {}
    
    self.rockTimer = 2

    self.score = 0
end

function PlayState:update(dt)
    self.rockTimer = self.rockTimer + dt

    if keyWasPressed('space') then
        self.player.dx = -self.player.dx
    end

    if love.keyboard.isDown('space') then
        self.player.dx = self.player.dx + (self.player.dx/math.abs(self.player.dx)) * SURFER_BOOST_SPEED * dt
    else
        self.player.dx = (self.player.dx/math.abs(self.player.dx)) * SURFER_SPEED
    end

    if self.rockTimer >= 3 then
        self.rockTimer = 0

        for i=1,3 do
            table.insert(self.rocks, Rock(math.random(2, 110), math.random(220, 320)))
        end
    end

    for k, rock in pairs(self.rocks) do
        rock:update(dt)

        if self.player:collides(rock) then
            gStateMachine:change('score', {score = self.score})
        end

        if rock.remove == true then
            table.remove(self.rocks, k)
            self.score = self.score + 1
        end
    end

    self.player:update(dt)
end

function PlayState:render()
    for k, rock in pairs(self.rocks) do
        rock:render()
    end

    self.player:render()

    love.graphics.setFont(gFonts['large'])
    love.graphics.print(self.score, VIRTUAL_WIDTH-24, 10)
end
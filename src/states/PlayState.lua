PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Surfer(VIRTUAL_WIDTH/2-7, VIRTUAL_HEIGHT/2+5)
    self.player.dx = math.random(1, 2) == 1 and SURFER_SPEED or -SURFER_SPEED

    self.rocks = {}
    
    self.rockTimer = 3

    self.score = 0

    gRockSS = 10
end

function PlayState:update(dt)
    gRockSS = gRockSS + 0.5 * dt
    self.rockTimer = self.rockTimer + dt * gRockSS / 10

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

        
        self.row = LevelMaker.spawnRocks(3+self.score/50)
        for i=1, 3+self.score/50 do
            --table.insert(self.rocks, Rock(math.random(2, 110), math.random(220, 320)))
            table.insert(self.rocks, self.row[i])
        end
    end

    for k, rock in pairs(self.rocks) do
        rock:update(dt)

        if self.player:collides(rock) then
            gSounds['crash']:play()
            
            if self.score > gHighscore then
                gHighscore = self.score
                gStateMachine:change('highscore')
            else
                gStateMachine:change('gameOver', {score = self.score})
            end
        end

        if rock.remove == true then
            table.remove(self.rocks, k)
            self.score = self.score + 1

            gSounds['confirm']:play()
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
    love.graphics.printf(self.score, 0, 5, VIRTUAL_WIDTH, 'center')
end
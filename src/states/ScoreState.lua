ScoreState = Class{__includes = BaseState}

function ScoreState:enter(args)
    self.score = args.score
end

function ScoreState:update(dt)
    if keyWasPressed('enter') or keyWasPressed('return') then
        gSounds['point']:play()

        gStateMachine:change('play')
    end
end

function ScoreState:render()
    love.graphics.setFont(gFonts['small'])
    if os.time() % 2 == 0 then love.graphics.printf('Press enter to start', 0, 170, VIRTUAL_WIDTH, 'center') end

    love.graphics.printf('Hold space to change direction and go faster.', 0, VIRTUAL_HEIGHT-20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['huge'])
    love.graphics.printf(self.score, 2, 60, 60, 'center')
    love.graphics.printf(gHighscore, 32, 60, 121, 'center')
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('SCORE:', 0, 55, 60, 'center')
    love.graphics.printf('HIGHSCORE:', 30, 55, 121, 'center')

    love.graphics.draw(gTextures['logo'], 19, 25)
end
HighscoreState = Class{__includes = BaseState}

function HighscoreState:update(dt)
    if keyWasPressed('enter') or keyWasPressed('return') then
        gSounds['point']:play()

        gStateMachine:change('score', {score = gHighscore})
    end
end

function HighscoreState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf(gHighscore, 0, VIRTUAL_HEIGHT/2 - 34, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('New Highscore!', 0, VIRTUAL_HEIGHT/2 - 56, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['small'])
    if os.time() % 2 == 0 then love.graphics.printf('Press enter to start', 0, 180, VIRTUAL_WIDTH, 'center') end
end
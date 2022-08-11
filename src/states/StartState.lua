StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if keyWasPressed('enter') or keyWasPressed('return') then
        gSounds['point']:play()

        gStateMachine:change('play')
    end
end

function StartState:render()
    love.graphics.setFont(gFonts['small'])
    if os.time() % 2 == 0 then love.graphics.printf('Press enter to start', 0, 140, VIRTUAL_WIDTH, 'center') end

    love.graphics.printf('Hold space to change direction and go faster.', 0, VIRTUAL_HEIGHT-20, VIRTUAL_WIDTH, 'center')

    love.graphics.draw(gTextures['logo'], 19, 30)
end
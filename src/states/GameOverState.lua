GameOverState = Class{__includes = BaseState}

function GameOverState:enter(args)
    self.score = args.score
end

function GameOverState:update(dt)
    if keyWasPressed('enter') or keyWasPressed('return') then
        gStateMachine:change('score', {score = self.score})
    end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf(self.score, 0, VIRTUAL_HEIGHT/2 - 36, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Game over!', 0, VIRTUAL_HEIGHT/2 - 58, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['small'])
    if os.time() % 2 == 0 then love.graphics.printf('Press enter', 0, 180, VIRTUAL_WIDTH, 'center') end
end
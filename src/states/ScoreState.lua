ScoreState = Class{__includes = BaseState}

function ScoreState:enter(args)
    self.score = args.score
end

function ScoreState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf(self.score, 0, VIRTUAL_HEIGHT/2 - 34, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Game over!', 0, VIRTUAL_HEIGHT/2 - 56, VIRTUAL_WIDTH, 'center')
end
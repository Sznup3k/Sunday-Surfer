ScoreState = Class{__includes = BaseState}

function ScoreState:enter(args)
    self.score = args.score
end

function ScoreState:render()
    love.graphics.printf(self.score, 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, 'center')
end
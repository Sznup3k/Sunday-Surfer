StartState = Class{__includes = BaseState}

function StartState:init()

end

function StartState:update(dt)
    if keyWasPressed('space') then
        gStateMachine:change('play')
    end
end

function StartState:redner()
    player:render()
end
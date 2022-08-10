StartState = Class{__includes = BaseState}

function StartState:update(dt)
    if keyWasPressed('enter') or keyWasPressed('return') then
        gStateMachine:change('play')
    end
end
PlayState = Class{__includes = BaseState}

function PlayState:init()
    player = Surfer(VIRTUAL_WIDTH/2-7, VIRTUAL_HEIGHT/2)
    player.dx = math.random(-1, 1) * SURFER_SPEED
end

function PlayState:update(dt)
    if love.keyboard.isDown('space') then
        player.dx = -player.dx
    end

    player:update(dt)
end

function PlayState:render()
    player:render()
end
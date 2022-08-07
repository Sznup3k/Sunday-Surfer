require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Sunday Surfer')

    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    gTextures = {
        ['wave1'] = love.graphics.newImage('graphics/wave1.png'),
        ['surfer1'] = love.graphics.newImage('graphics/surfer1.png')
    }

    gStateMachine = StateMachine{
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('start')

    player = Surfer(VIRTUAL_WIDTH/2-7, VIRTUAL_HEIGHT/2)

    keyboard = {}
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    keyboard[key] = true
end

function keyWasPressed(key)
    if keyboard[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    gStateMachine:update(dt)

    keyboard = {}
end

function love.draw()
    push:start()

    love.graphics.clear(20/255, 20/255, 20/255)
    love.graphics.draw(gTextures['wave1'], 0, VIRTUAL_HEIGHT/2-20)
    gStateMachine:render()

    push:finish()
end
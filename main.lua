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
        ['surfer1'] = love.graphics.newImage('graphics/surfer1.png'),
        ['rock'] = love.graphics.newImage('graphics/rock.png')
    }

    gStateMachine = StateMachine{
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
    }
    gStateMachine:change('start')

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

    --wave_scroll = (wave_scroll + WAVE_SS * dt) % WAVE_LP

    keyboard = {}
end

function love.draw()
    push:start()

    love.graphics.clear(20/255, 20/255, 20/255)
    love.graphics.draw(gTextures['wave1'], -wave_scroll, VIRTUAL_HEIGHT/2-20)
    gStateMachine:render()

    push:finish()
end
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
        ['surfer'] = love.graphics.newImage('graphics/surfer.png'),
        ['rock'] = love.graphics.newImage('graphics/rock.png'),
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['logo'] = love.graphics.newImage('graphics/SundaySurfer-logo.png')
    }

    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8), -- link to the font https://github.com/games50/breakout/blob/730f5ff3db7ccddf40270ddb041e1ec65ee995d0/breakout0/fonts/font.ttf (im acctually not sure if its the exact same font but its deffenietely from the GD50)
        ['large'] = love.graphics.newFont('fonts/kiwisoda.ttf', 16) -- link to the font https://www.dafont.com/bitmap.php?page=3
    }
    love.graphics.setFont(gFonts['small'])

    gSounds = {
        ['crash'] = love.audio.newSource('sounds/crash.wav', 'static'),
        ['point'] = love.audio.newSource('sounds/point.wav', 'static'),
        ['confirm'] = love.audio.newSource('sounds/confirm.wav', 'static'),
        ['music'] = love.audio.newSource('sounds/music.mp3', 'static')
    }
    --gSounds['music']:setLooping(true)
    --gSounds['music']:play()

    gStateMachine = StateMachine{
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end,
        ['highscore'] = function() return HighscoreState() end
    }
    gStateMachine:change('start')

    highscore = 0

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

    love.graphics.draw(gTextures['background'], -4, -7)
    love.graphics.draw(gTextures['wave1'], 0, VIRTUAL_HEIGHT/2-20)
    gStateMachine:render()

    push:finish()
end
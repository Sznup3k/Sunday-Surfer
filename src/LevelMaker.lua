LevelMaker = Class{__includes = BaseState}

function LevelMaker.spawnRocks(it)
    local rocks = {}
    local lastX = VIRTUAL_WIDTH/2 - 15
    local lastY = math.random(220, 270)
    local rng = math.random(3)
    local lr = math.random(2) == 1 and 1 or -1
    
    for i=1, it do
        x = math.random(2, 110)
        y = math.random(220, 270)

        if math.abs(x-lastX) < 45 then
            x = lastX + lr * 10

            if rng == 1 then y = lastY + math.random(-1, 1)
            else y = lastY + math.random(5, 10) end
        end
        table.insert(rocks, Rock(x, y))

        lastX = x
        lastY = y
    end

    return rocks
end
function love.load()
    love.window.setTitle("Bubble Generator! - AAOOII-RN :)")
    love.graphics.setDefaultFilter("nearest")
    Bubbles = {}
    T = -1
end

function CreateBubbles()
    local rect = {
        x = love.mouse.getX(),
        xs = love.math.random(-500, 500),
        y = love.mouse.getY(),
        ys = love.math.random(-500, 500),
        r = love.math.random(3, 10),
    }    

    table.insert(Bubbles, rect)
end

function love.keypressed(key)
    if key == "space" then -- Press space to switch the bubble generator
        T = -1 * T
    end
end

function love.update(dt)
    if T == 1 then
        CreateBubbles()
    end

    for i, v in ipairs(Bubbles) do
        v.x = v.x + v.xs * dt
        v.y = v.y + v.ys * dt
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 1)
    love.graphics.setColor(0.25, 0.25, 1) -- Sets color to text and bubbles
    love.graphics.print("Press space to activate the bubble generator!", 100, 100)
    for i, v in ipairs(Bubbles) do
        love.graphics.circle("fill", v.x, v.y, v.r)
    end
end
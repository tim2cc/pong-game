-- love 2d engine https://love2d.org/wiki/love

-- https://github.com/Ulydev/push - lib
push = require "push"

WIDTH = 1200
HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
    -- players variables
    player1Score = 0
    player2Score = 0
    paddle1X = 10   
    paddle1Y = VIRTUAL_HEIGHT - 50
    paddle2X = VIRTUAL_WIDTH - 14
    paddle2Y = 50
    

    -- graphics rendering
    love.graphics.setDefaultFilter('nearest', "nearest")
    -- font setup
    smallFont = love.graphics.newFont('/resources/prstartk.ttf', 8)

    scoreFont = love.graphics.newFont('/resources/prstartk.ttf', 24)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WIDTH, HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })   
end

function love.update(dt)
    -- paddle 1 movenment
    if love.keyboard.isDown('a') then
        paddle1Y = paddle1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('z') then
        paddle1Y = paddle1Y + PADDLE_SPEED * dt
    end
    
    -- paddle 2 movenment
    if love.keyboard.isDown('k') then
        paddle2Y = paddle2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('m') then
        paddle2Y = paddle2Y + PADDLE_SPEED * dt
    end
end


function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    end
    
end

function love.draw()
    push:apply('start')
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.printf(
        'Boobi Pong 2',
        0,
        VIRTUAL_HEIGHT - 12,
        VIRTUAL_WIDTH,
        'center'

    )

    love.graphics.rectangle('fill', paddle2X, paddle2Y, 5, 20)
    love.graphics.rectangle('fill',paddle1X, paddle1Y, 5, 20)

    push:apply('end') 
end
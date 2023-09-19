-- love 2d game engine https://love2d.org/wiki/love


-- https://github.com/Ulydev/push - lib
push = require 'push'
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'class'
-- classes
require 'Paddle'
require 'Ball'

WIDTH = 1200
HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243
PADDLE_SPEED = 200

function love.load()
    player1Score = 0
    player2Score = 0
    -- graphics rendering
    love.graphics.setDefaultFilter('nearest', "nearest")
    --generate the seed
    math.randomseed(os.time())
    -- font setup
    smallFont = love.graphics.newFont('/resources/prstartk.ttf', 8)

    scoreFont = love.graphics.newFont('/resources/prstartk.ttf', 24)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WIDTH, HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    love.window.setTitle('Boobi Pong 2')
    
    player1 = Paddle(10, 30, 5, 20)
    player2 = Paddle(VIRTUAL_WIDTH - 14, VIRTUAL_HEIGHT - 35, 5, 20)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    gameState = 'start'
end

function love.update(dt)
    -- paddle 1 movenment
    if love.keyboard.isDown('a') then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('z') then
        player1.dy = PADDLE_SPEED
    else 
        player1.dy = 0
    end
    
    -- paddle 2 movenment
    if love.keyboard.isDown('k') then
        player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('m') then
        player2.dy = PADDLE_SPEED
    else
        player2.dy = 0
    end

    if gameState == 'play' then
        ball:update(dt)
    end

    player1:update(dt)
    player2:update(dt)
end


function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    elseif key == 'enter' or key == 'space' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ball:reset()
        end
    end
    
end

function love.draw()
    push:apply('start')
    love.graphics.setFont(smallFont)
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.printf(
        'Boobi Pong 2',
        0,
        5,
        VIRTUAL_WIDTH,
        'center'
    )

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 55, VIRTUAL_HEIGHT / 3 + 20)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 35, VIRTUAL_HEIGHT / 3 + 20)

    player1:render()
    player2:render()

    ball:render()

    displayFPS()

    push:apply('end') 
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.print('FPS: '.. tostring(love.timer.getFPS()), 10, 10)
end
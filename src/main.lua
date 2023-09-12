push = require "push"

WIDTH = 1200
HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()

    player1Score = 0
    player2Score = 0
    paddle1X = VIRTUAL_WIDTH - 10   
    paddle1Y = VIRTUAL_HEIGHT - 50
    


    love.graphics.setDefaultFilter('nearest', "nearest")

    smallFont = love.graphics.newFont('../resources/prstartk.ttf', 8)

    scoreFont = love.graphics.newFont('../resources/prstartk.ttf', 24)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WIDTH, HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })   
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

    love.graphics.rectangle('fill', 10, 30, 5, 20)
    love.graphics.rectangle('fill',paddle1X, paddle1Y, 5, 20)
    love.graphics.rectangle('fill',VIRTUAL_WIDTH / 2 - 2 , VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    push:apply('end') 
end
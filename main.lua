require 'player'
--require 'player2'
require 'mapRenderer'

function love.load()
    mapRender:load()
    --player:load()
    Player:load()
end

function love.update(dt)
    --player:move(dt)
    --player:physics(dt)
    mapRender:update(dt)
    Player:update(dt)
end

--ordem para renderizar eh de tras pra frente
function love.draw()
    --desenhar mapa
    mapRender:draw()
    --desenhar player
    Player:draw()
    --player:draw()
    --desenhar UI
    love.graphics.print("FPS:" ..tostring(love.timer.getFPS()), 10, 10)
end
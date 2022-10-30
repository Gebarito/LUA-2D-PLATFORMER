local STI = require("libraries/sti")

mapRender = {}

function mapRender:load()
    Map = STI("Maps/test.lua", {"box2d"})
    World = love.physics.newWorld(0,0)
    Map:box2d_init(World)
    World:setCallbacks(beginContact,endContact)
    --Map.layers.solid.visible = false
end

function mapRender:update(dt)
    World:update(dt)
end

function mapRender:draw()
    Map:draw(0,0,2,2)
end
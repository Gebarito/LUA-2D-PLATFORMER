Player = {}

function Player:load()
    -- Propriedades tecnicas do personagem, tamanho, posicao, velociodade...
    self.width = 50
    self.heigth = 50
    self.x = 0
    self.y = 0

    --Propriedades de gameplay, velociodade, vida...
    self.hp = 3
    self.vel = 500
    self.maxVel = 1500
    self.maxJump = 1500
end

function Player:update(dt)
    Player:move(dt)
end

function Player:move(dt)
    if love.keyboard.isDown("d", "right") then
        print("Direita\n")
        --andar para direita
        Player.x = Player.x * Player.vel * dt
    elseif love.keyboard.isDown("a", "left") then
        --andar para esquerda
        print("Esquerda\n")
    end
end

function Player:applyGravity()
end

function Player:applyFriction()
end

function Player:draw()
   -- love.graphics.push()
    --love.graphics.scale(2,2)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, self.width, self.heigth)
    --love.graphics.pop()
end
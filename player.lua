Player = {}

function Player:load()
    love.graphics.setDefaultFilter("nearest", "nearest") --Melhora a qualidade dos sprites

    -- Propriedades tecnicas do personagem, tamanho, posicao, velociodade...
    self.width = 50
    self.heigth = 50
    self.x = love.graphics.getHeight()/2
    self.y = love.graphics.getWidth()/2

    --Propriedades de gameplay, velociodade, vida...
    self.hp = 3
    self.speed = 500
    self.maxSpeed = 5000
    self.acceleration = 1000
    self.friction = 2500
    self.gravity = 1500
    self.grounded = false
    self.jumpAmount = -500
    self.running = false
    self.maxJump = 40
    self.xSpeed = 0
    self.ySpeed = 0

    --load physics
    self.physics = {}
    self.physics.body = love.physics.newBody(World,self.x,self.y, "dynamic")
    self.physics.body:setFixedRotation( true )
    self.physics.shape = love.physics.newRectangleShape(self.width,self.heigth)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
end

function Player:update(dt)
    Player:syncMove()
    Player:move(dt)
end

function Player:move(dt)
    if love.keyboard.isDown("d", "right") then
        if self.xSpeed < self.maxSpeed then
            self.xSpeed = self.xSpeed + self.acceleration * dt
            --print(self.xSpeed .. ': andando para direita')
            self.running = true
        else
            self.xSpeed = self.maxSpeed
        end
    elseif love.keyboard.isDown("a", "left") then
        if self.xSpeed > -self.maxSpeed then
            self.xSpeed = self.xSpeed - self.acceleration * dt
            --print('andando')
            self.running = true
        end
    else
        self:applyFriction(dt)
        --self.xSpeed = 0
        self.running = false
    end
end

function Player:applyGravity()
end

function Player:syncMove()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xSpeed, self.ySpeed)
    print(self.x .. self.y)
end

function Player:applyFriction(dt)
    if self.xSpeed > 0 then
        self.xSpeed = self.xSpeed - self.friction * dt
    elseif self.xSpeed < 0 then
        self.xSpeed = self.xSpeed + self.friction * dt
    end
end

function Player:draw()
   -- love.graphics.push()
    --love.graphics.scale(2,2)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.heigth)
    --love.graphics.pop()
end
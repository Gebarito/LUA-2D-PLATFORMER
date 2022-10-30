player = {}

--this is where we set atributes of the player
function player:load()
	player.x = 10
	player.y = 10
	player.width = 10
	player.height = 10
	player.xvel = 0
	player.yvel = 0
	player.friction = 200
	player.speed = 500
end

--this is where the player is drawn from
function player:draw()
	love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
end

--this is where the phusics are handled
function player:physics(dt)
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
end

--this is where the movement is handled
function player:move(dt)
	if love.keyboard.isDown("d") and
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
    
    elseif love.keyboard.isDown("a") and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
    end
    if love.keyboard.isDown("d") == false and love.keyboard.isDown("a") == false then
        player.xvel = 0
    end
end
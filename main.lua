local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()
local posX, posY
local posXplayer = screenWidth / 2
local posYplayer = screenHeight / 2
local radius = 10
local message = false
local countdown = 30

function time()
  if countdown > 0 then
    love.timer.sleep(1)
    countdown = countdown - 1
    print(countdown)
  end
end

function love.load()
  posX = love.math.random(0, screenWidth - radius)
  posY = love.math.random(0, screenHeight - radius)
end

function love.update(dt)
  
  if love.keyboard.isDown("z") then
    posYplayer = posYplayer - 1
  elseif love.keyboard.isDown("s") then
    posYplayer = posYplayer + 1
  elseif love.keyboard.isDown("q") then
    posXplayer = posXplayer - 1
  elseif love.keyboard.isDown("d") then
    posXplayer = posXplayer + 1
  end
  
  if love.keyboard.isDown("lctrl") and love.keyboard.isDown("z") then
    posYplayer = posYplayer - 5
  elseif love.keyboard.isDown("lctrl") and love.keyboard.isDown("s") then
    posYplayer = posYplayer + 5
  elseif love.keyboard.isDown("lctrl") and love.keyboard.isDown("q") then
    posXplayer = posXplayer - 5
  elseif love.keyboard.isDown("lctrl") and love.keyboard.isDown("d") then
    posXplayer = posXplayer + 5
  end
  
  if love.keyboard.isDown("lshift") and love.keyboard.isDown("z") then
    posYplayer = posYplayer - 10
  elseif love.keyboard.isDown("lshift") and love.keyboard.isDown("s") then
    posYplayer = posYplayer + 10
  elseif love.keyboard.isDown("lshift") and love.keyboard.isDown("q") then
    posXplayer = posXplayer - 10
  elseif love.keyboard.isDown("lshift") and love.keyboard.isDown("d") then
    posXplayer = posXplayer + 10
  end
  
  if posX == posXplayer and posY == posYplayer then
    message = true
  end
  
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", posX, posY, 10)
  love.graphics.setColor(255, 0, 0)
  love.graphics.circle("fill", posXplayer, posYplayer, 10)
  if message == true then
    love.graphics.clear()
    love.graphics.setColor(50, 50, 0)
    love.graphics.print("Victoire !!", screenWidth / 3, screenHeight / 3, 0, 3, 3) 
  end
end


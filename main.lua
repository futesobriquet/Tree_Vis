local lastclick = 0
local clickInterval = 0.2 --Number of seconds between double clicks
local delInterval = 0.1
local targetNode = nil
require('constants')
require('Node')
function love.load()
	love.graphics.setBackgroundColor(white)
	love.graphics.setColor(black)
	node1 = Node:new()
	text = "This text is aligned, and wraps when it gets too big."
	node1:setText(text)
end
function love.draw()
	for i,thisNode in pairs(nodeList) do
		thisNode:draw()
	end
end

function love.mousepressed(x, y, button)
targetNode = nil

for i,thisNode in pairs(nodeList) do
	if thisNode:containsCursor(x,y) then
		targetNode = thisNode
	end
end

 if button == "l" and targetNode ~= nil then
	local curTime = love.timer.getTime()
    if curTime <= lastclick + clickInterval then
        --love.keyboard.setTextInput(true)
    else
       lastclick = curTime
    end
	targetNode:setDrag(true, x, y)
  end
if button == "r" and targetNode ~= nil then
	node2 = Node:new() --                                            hard code
	targetNode:addChild(node2, 'else')
end
end

function love.mousereleased(x, y, button)
  if button == "l" and targetNode ~= nil then targetNode:setDrag(false) end
end

function love.update(dt)
	if targetNode ~= nil then
		if targetNode.dragging.active == true then --should have a method--oop?
			targetNode:drag(love.mouse.getPosition())
		end
	end
end

function love.textinput(t)
	if targetNode ~= nil then
		text = targetNode:getText()
		targetNode:setText(text .. t)
	end
end

function love.keypressed(key)
   if key == 'backspace' and targetNode ~= nil then
				text = targetNode:getText()
				text = text:sub(1, -2)
				targetNode:setText(text)
   end
end

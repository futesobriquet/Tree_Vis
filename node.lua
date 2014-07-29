local class = require('lib.30log.30log')
require('constants')
Node = class { x = 100, y = 100, width = 100, height = 100, title = 'Title', text = 'X value', dragging = { active = false, diffX = 0, diffY = 0 }, children = {}}

function Node:__init(x,y,title)
  self.x,self.y = x,y
  self.title = title
  table.insert(nodeList, self) --eesh oop
end

function Node:addChild(child, condition) 
	self.children[child] = condition
end

-- function Node:addElse(theElse)
	-- self.elses.insert(theElse)
-- end

function Node:draw()
	love.graphics.setColor(black)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.setColor(blue)
	love.graphics.setFont(titleFont)
	love.graphics.printf(self.title, self.x, self.y, self.width, "center")
	love.graphics.setColor(black)
	love.graphics.setFont(normalFont)
	love.graphics.printf(self.text, self.x, self.y + 20, self.width, "center")
end

function Node:containsCursor(x,y)
	contains = x > self.x and y > self.y and x < self.x + self. width and y < self.y + self.height
	return contains 
end

function Node:drag(dX, dY)
    self.x = dX - self.dragging.diffX
    self.y = dY - self.dragging.diffY
end
function Node:setDrag(condition, x, y)
    x = x or 0
	y = y or 0
	self.dragging.active = condition
	self.dragging.diffX = x - self.x
	self.dragging.diffY = y - self.y
end
function Node:getText()
	return self.text
end

function Node:setText(text)
	self.text = text
end
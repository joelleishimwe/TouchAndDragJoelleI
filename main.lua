-- Title: TouchAndDrag
-- Name: Joelle Ishimwe
-- Course: ICS2O
-- This program displays images that can be draged around on the screen
-----------------------------------------------------------------------------------------

-- create sound
local music = audio.loadSound ("Sounds/littleidea.mp3")
local musicChannel 
music = audio.play(music)

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- put in background with a certain length and height
local backgroundImage = display.newImageRect ( "Images/background.png", 2048, 1536 )

-- display the girl 1 character with a specific height and width
local girl1 = display.newImageRect( "Images/girl1.png", 150, 150 )
local girl2 = display.newImageRect( "Images/girl2.png", 150, 150 )

-- set the local variable to the characters' width 
local girl1Width = girl1.width
local girl2Width = girl2.width

-- set the local variable to the characters' height
local girl1Height = girl1.height
local girl2Height = girl2.height

-- my boolean variable to keep track of which object I touched first
local alreadyTouchedGirl1 = false 
local alreadyTouchedGirl2 = false

-- initialize the x and y position of girl 1 and girl 2
girl1.x = 300
girl1.y = 200

girl2.x = 400
girl2.y = 600

-- Function: Girl1Listener
-- Input: touch listener
-- Output: none
-- Description: when girl 1 is touched, move her
local function Girl1Listener(touch)
	
	-- this part gets executed when the girl 1 is first touched
	if (touch.phase == "began") then
		if (alreadyTouchedGirl2 == false) then
			alreadyTouchedGirl1= true
		end
	end

	-- this part gets executed while the girl 1 is being moved
	if ( (touch.phase == "moved") and (alreadyTouchedGirl1 == true) ) then
		girl1.x = touch.x
		girl1.y = touch.y
	end

	-- this part gets executed when the girl 1 is released
	if (touch.phase == "ended") then
		alreadyTouchedGirl1 = false
		alreadyTouchedGirl2 = false
	end
end

-- add the respective listeners to each object
girl1:addEventListener("touch", Girl1Listener)

-- Function: Girl2Listener
-- Input: touch listener
-- Output: none
-- Description: when girl 2 is touched move her
local function Girl2Listener(touch)
	
	-- this part gets executed when the girl 2 is first touched
	if (touch.phase == "began") then
		if (alreadyTouchedGirl1 == false) then
			alreadyTouchedGirl2 = true
		end
	end

	-- this part gets executed while the girl 2 is being moved
	if ( (touch.phase == "moved") and (alreadyTouchedGirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end

	-- this part gets executed when the girl 2 is released
	if (touch.phase == "ended") then
		alreadyTouchedGirl1 = false
		alreadyTouchedGirl2 = false
	end
end

-- add the respective listeners to each object
girl2:addEventListener("touch", Girl2Listener)



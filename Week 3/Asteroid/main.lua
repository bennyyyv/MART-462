-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Initialize variables
local lives = 3
local score = 0
local died = false
 
local asteroidsTable = {} -- this is an array (called tables in Lua)
 
local ship
local gameLoopTimer
local livesText
local scoreText

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )

-- Seed the random number generator
math.randomseed( os.time() )

-- Load the background
local backGroup = display.newGroup()

local background = display.newImageRect("background.png", 800, 1400 )
background.x = display.contentCenterX
background.y = display.contentCenterY
--special group for background items 
backGroup:insert(background)

local sheetOptions =
{
    --coordinates on sprite sheet
    frames =
    {
        {   -- 1) asteroid 1
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        {   -- 2) asteroid 2
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        {   -- 3) asteroid 3
            x = 0,
            y = 168,
            width = 100,
            height = 97
        },
        {   -- 4) ship
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        {   -- 5) laser
            x = 98,
            y = 265,
            width = 14,
            height = 40
        },
    },
}

local objectSheet = graphics.newImageSheet( "gameObjects.png", sheetOptions )

--main group for interactive items
local mainGroup = display.newGroup()
-- Ship variable = normal display code (objectSheet, #on objectSheet, size)
ship = display.newImageRect( objectSheet, 4, 98, 79 )
-- center object
ship.x = display.contentCenterX
ship.y = display.contentHeight - 100
physics.addBody( ship, { radius=30, isSensor=true } )
ship.myName = "ship"
mainGroup:insert(ship)

-- Display lives and score
local uiGroup = display.newGroup()
livesText = display.newText( "Lives: " .. lives, 200, 80, native.systemFont, 36 )
scoreText = display.newText( "Score: " .. score, 400, 80, native.systemFont, 36 )
uiGroup:insert(livesText)
uiGroup:insert(scoreText)

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end

local function createAsteroid()
   local mainGroup = display.newGroup()
   --reference the object sheet and the # on sheet
    local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
    --table is an array
    table.insert( asteroidsTable, newAsteroid )
    physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
    newAsteroid.myName = "asteroid"
 
    local whereFrom = math.random( 3 )
    mainGroup:insert(newAsteroid)

     if ( whereFrom == 1 ) then
        -- From the left
        newAsteroid.x = -60
        newAsteroid.y = math.random( 500 )
        newAsteroid:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
    elseif ( whereFrom == 2 ) then
        -- From the top
        newAsteroid.x = math.random( display.contentWidth )
        newAsteroid.y = -60
        newAsteroid:setLinearVelocity( math.random( -40,40 ), math.random( 40,120 ) )
    elseif ( whereFrom == 3 ) then
        -- From the right
        newAsteroid.x = display.contentWidth + 60
        newAsteroid.y = math.random( 500 )
        newAsteroid:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
          elseif ( whereFrom == 3 ) then
        -- From the right
        newAsteroid.x = display.contentWidth + 60
        newAsteroid.y = math.random( 500 )
        newAsteroid:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
    end
 
    newAsteroid:applyTorque( math.random( -6,6 ) )

     mainGroup:insert(newAsteroid)

end

createAsteroid()

local function fireLaser()
   local mainGroup = display.newGroup()
    local newLaser = display.newImageRect(objectSheet, 5, 14, 40 )
    physics.addBody( newLaser, "dynamic", { isSensor=true } )
    newLaser.isBullet = true
    newLaser.myName = "laser"
 
     newLaser.x = ship.x
     newLaser.y = ship.y
     newLaser:toBack()
     transition.to( newLaser, { y=-40, time=500,
        onComplete = function() display.remove( newLaser ) end
    } )
end

ship:addEventListener( "tap", fireLaser )




-- local physics  = require ("physics")
-- physics.start()
display.setStatusBar(display.HiddenStatusBar)
local screenWidth = display.contentWidth
local screenHeight = display.contentHeight
local screenCenterX = display.contentCenterX
local screenCenterY = display.contentCenterY
----set the width, height, and center value of the screen
local buiHeight = screenHeight/2
local buiWidth = buiHeight/2
----the building's height and width
local buiCenterX = buiWidth  * 0.5
local buiCenterY = buiHeight * 0.5

local buiX=screenWidth-buiWidth
local buiY=screenHeight-buiCenterY
local t
local myWin
local key=1
---the center is always located in the hxeart of the buidlding, isn't it?
--display.setDefault( "background", 38/255, 50/255, 72/255 )
display.setDefault( "background", 24/255, 49/255, 82/255 )
local myMoon=display.newImage("moon.png")
myMoon.x=100
 myMoon.y=250
--local displayWord = display.newText(allText,700,200,"Comic Sans MS",50)

local inText=display.newText("Shake",800,350,"Comic Sans MS",80)
 local inText2=display.newText("Click the UFO",800,480,"Comic Sans MS",60)
inText:setFillColor (0, 1, 1 )
inText2:setFillColor (0, 1, 1 )
local function myBuild()
	
	myrect=display.newRect(buiX-40*2,buiY-100,buiWidth+2*40,buiHeight+100+3*30)
	 myrect:setFillColor( 0,0,0 )

end

function buildMatrix(width, height)
	t={}
	for i=1, height do
		t[i]={}
		for j=1,width do
			t[i][j]=1
		end
	end
	return t
end
	local myWindow=buildMatrix(5,6)

 function myWindow:draw() 	
	for i=1, 6 do 
	for j=1, 5 do 
	myWindow[i][j]=5*i+j
	b=myWindow[i][j]
	--return myWindow
	myWin=display.newRect(buiX+j*50-buiWidth, i*100+buiY-buiHeight,40,30)
	if  math.mod(b, 2) == 0 then
 myWin:setFillColor( 169/255,169/255,169/255 )

if key==-1 then
	myWin:setFillColor( 226/255,221/255,12/255 )
	 
	 end
end
if math.mod(b, 2) ~= 0 then
	myWin:setFillColor( 226/255,221/255,12/255 )

end
if key==2 then
	--local function fallWindow()
--    physics.setGravity(0,2)
   
--     physics.addBody(myWin,"dynamic",{density=0.1, friction=1,bouce=0.2, shape=6})
-- end
-- fallWindow()
transition.to( myWin, { time=1500, alpha=0, x=80, y=120} )

end
--timer.performWithDelay(1000, fallWindow,1)
	--end
	end
end
	
	return b
    
    end

function listener (event)
	myBuild()
myWindow:draw(30,30)
end
timer.performWithDelay( 1000, listener, 0)



local options=
{
	width=520,
	height=306,
	numFrames=4,
	sheetContentWidth=1961,
	sheetContendtHeight=306
}
local mySheet1=graphics.newImageSheet("ufo.png",options)
local sequenceData=
{
	name="moon",start=1,count=4,time=2500
	
}
local animation = display.newSprite(mySheet1, sequenceData)
animation.x = 80
animation.y = 120
local motionx =0
-- animation.x = animation.x+motionx
animation:play()

local function myTapListener( event )
key=2

    return true
 end

local myButton = animation
myButton:addEventListener( "tap", myTapListener )
function onShake(event)
 if event.isShake then

key=-1
end
end
 Runtime:addEventListener("accelerometer", onShake)
timer.performWithDelay( 1000, onShake )

 local widget = require( "widget" )
 local function handleButtonEvent( event )
     if ( "ended" == event.phase ) then
   key=1
   --physics.cancel()
end
       print( "Button was pressed and released" )
     end

     
-- -- Create the widget
local button1 = widget.newButton
{
      left = 700,
      top = 150,
      id = "button1",
      label = "Stop",
      fontSize=80,
      font="Comic Sans MS",
      labelColor = { default={ 0, 1, 1 }, over={ 0, 0, 0, 0.5 } },
      onEvent = handleButtonEvent
 }
	

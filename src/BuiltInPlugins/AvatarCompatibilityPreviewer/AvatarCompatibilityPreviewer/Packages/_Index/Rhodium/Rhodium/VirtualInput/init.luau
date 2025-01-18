local v0 = require(script.Parent.InputTypes.Keyboard);
local v1 = require(script.Parent.InputTypes.Mouse);
local v2 = require(script.Parent.InputTypes.Touch);
local v3 = require(script.Parent.InputTypes.Text);
local v4 = require(script.Parent.InputTypes.GamePad);
local v5 = require(script.Parent.VirtualInputUtils);
return {
    Keyboard = v0, 
    Mouse = v1, 
    Touch = v2, 
    Text = v3, 
    GamePad = v4, 
    setCurrentWindow = v5.setCurrentWindow, 
    getCurrentWindow = v5.getCurrentWindow, 
    waitForInputEventsProcessed = v5.waitForInputEventsProcessed
};
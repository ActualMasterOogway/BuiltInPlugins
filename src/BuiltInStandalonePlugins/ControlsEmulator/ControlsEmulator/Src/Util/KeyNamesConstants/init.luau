local v0 = {
    "L1", 
    "L2", 
    "R1", 
    "R2", 
    "Options", 
    "Triangle", 
    "Square", 
    "O", 
    "A", 
    "B", 
    "X", 
    "Y", 
    "R Thumbstick Click", 
    "R Thumbstick Up", 
    "R Thumbstick Down", 
    "R Thumbstick Left", 
    "R Thumbstick Right", 
    "DPad Up", 
    "DPad Down", 
    "DPad Left", 
    "DPad Right", 
    "L Thumbstick Click", 
    "L Thumbstick Up", 
    "L Thumbstick Down", 
    "L Thumbstick Left", 
    "L Thumbstick Right", 
    "Start", 
    "Select"
};
local v1 = {
    ["L Thumbstick Click"] = {
        keyCode = Enum.KeyCode.ButtonL3, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    ["L Thumbstick Up"] = {
        keyCode = Enum.KeyCode.Thumbstick1, 
        direction = Vector3.new(0, 1, 0, 0)
    }, 
    ["L Thumbstick Down"] = {
        keyCode = Enum.KeyCode.Thumbstick1, 
        direction = Vector3.new(0, -1, 0, 0)
    }, 
    ["L Thumbstick Right"] = {
        keyCode = Enum.KeyCode.Thumbstick1, 
        direction = Vector3.new(1, 0, 0, 0)
    }, 
    ["L Thumbstick Left"] = {
        keyCode = Enum.KeyCode.Thumbstick1, 
        direction = Vector3.new(-1, 0, 0, 0)
    }, 
    ["R Thumbstick Click"] = {
        keyCode = Enum.KeyCode.ButtonR3, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    ["R Thumbstick Up"] = {
        keyCode = Enum.KeyCode.Thumbstick2, 
        direction = Vector3.new(0, 1, 0, 0)
    }, 
    ["R Thumbstick Down"] = {
        keyCode = Enum.KeyCode.Thumbstick2, 
        direction = Vector3.new(0, -1, 0, 0)
    }, 
    ["R Thumbstick Right"] = {
        keyCode = Enum.KeyCode.Thumbstick2, 
        direction = Vector3.new(1, 0, 0, 0)
    }, 
    ["R Thumbstick Left"] = {
        keyCode = Enum.KeyCode.Thumbstick2, 
        direction = Vector3.new(-1, 0, 0, 0)
    }, 
    ["DPad Up"] = {
        keyCode = Enum.KeyCode.DPadUp, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    ["DPad Left"] = {
        keyCode = Enum.KeyCode.DPadLeft, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    ["DPad Right"] = {
        keyCode = Enum.KeyCode.DPadRight, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    ["DPad Down"] = {
        keyCode = Enum.KeyCode.DPadDown, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    X = {
        keyCode = Enum.KeyCode.ButtonX, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    Y = {
        keyCode = Enum.KeyCode.ButtonY, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    B = {
        keyCode = Enum.KeyCode.ButtonB, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    A = {
        keyCode = Enum.KeyCode.ButtonA, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    L1 = {
        keyCode = Enum.KeyCode.ButtonL1, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    R1 = {
        keyCode = Enum.KeyCode.ButtonR1, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    L2 = {
        keyCode = Enum.KeyCode.ButtonL2, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    R2 = {
        keyCode = Enum.KeyCode.ButtonR2, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    Start = {
        keyCode = Enum.KeyCode.ButtonStart, 
        direction = Vector3.new(0, 0, 1, 0)
    }, 
    Select = {
        keyCode = Enum.KeyCode.ButtonSelect, 
        direction = Vector3.new(0, 0, 1, 0)
    }
};
return {
    KEY_NAMES_LIST_DISPLAY_ORDER = v0, 
    KEY_NAMES_DEFINITIONS = v1
};
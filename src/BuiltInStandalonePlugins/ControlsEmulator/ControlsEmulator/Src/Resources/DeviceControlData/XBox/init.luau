return {
    DeviceImage = {
        type = "Background", 
        srcDark = "rbxasset://textures/ControlsEmulator/XBox_Dark.png", 
        srcLight = "rbxasset://textures/ControlsEmulator/XBox_Light.png"
    }, 
    ThumbstickLeft = {
        keyCode = Enum.KeyCode.Thumbstick1, 
        type = "Thumbstick", 
        Position = UDim2.new(0.265, 0, 0.5, 0), 
        relativeStickSize = 0.38, 
        relativeSocketSize = 0.22
    }, 
    ThumbstickLeftMappings = {
        upKeyName = "L Thumbstick Up", 
        downKeyName = "L Thumbstick Down", 
        leftKeyName = "L Thumbstick Left", 
        rightKeyName = "L Thumbstick Right", 
        centerKeyName = "L Thumbstick Click", 
        type = "CrossLayoutMappings", 
        side = "Left", 
        Position = UDim2.new(-0.02, 0, 0.57, 0), 
        arrowDestination = UDim2.new(0.26, 0, 0.5, 0), 
        arrowBendPoint = 0.9
    }, 
    ThumbstickRight = {
        keyCode = Enum.KeyCode.Thumbstick2, 
        type = "Thumbstick", 
        Position = UDim2.new(0.625, 0, 0.627, 0), 
        relativeStickSize = 0.38, 
        relativeSocketSize = 0.22
    }, 
    ThumbstickRightMappings = {
        upKeyName = "R Thumbstick Up", 
        downKeyName = "R Thumbstick Down", 
        leftKeyName = "R Thumbstick Left", 
        rightKeyName = "R Thumbstick Right", 
        centerKeyName = "R Thumbstick Click", 
        type = "CrossLayoutMappings", 
        side = "Right", 
        Position = UDim2.new(1.02, 0, 0.831, 0), 
        arrowDestination = UDim2.new(0.627, 0, 0.627, 0), 
        arrowBendPoint = 0.6
    }, 
    ArrowUp = {
        keyCode = Enum.KeyCode.DPadUp, 
        type = "Button", 
        Position = UDim2.new(0.38, 0, 0.557, 0), 
        Size = UDim2.new(0.041, 0, 0.041, 0)
    }, 
    ArrowRight = {
        keyCode = Enum.KeyCode.DPadRight, 
        type = "Button", 
        Position = UDim2.new(0.425, 0, 0.596, 0), 
        Size = UDim2.new(0.041, 0, 0.041, 0)
    }, 
    ArrowDown = {
        keyCode = Enum.KeyCode.DPadDown, 
        type = "Button", 
        Position = UDim2.new(0.38, 0, 0.638, 0), 
        Size = UDim2.new(0.041, 0, 0.041, 0)
    }, 
    ArrowLeft = {
        keyCode = Enum.KeyCode.DPadLeft, 
        type = "Button", 
        Position = UDim2.new(0.337, 0, 0.595, 0), 
        Size = UDim2.new(0.041, 0, 0.041, 0)
    }, 
    ArrowsMappings = {
        upKeyName = "DPad Up", 
        downKeyName = "DPad Down", 
        leftKeyName = "DPad Left", 
        rightKeyName = "DPad Right", 
        type = "CrossLayoutMappings", 
        side = "Left", 
        Position = UDim2.new(0, 0, 0.825, 0), 
        arrowDestination = UDim2.new(0.375, 0, 0.6, 0), 
        arrowBendPoint = 0.6
    }, 
    ButtonX = {
        keyCode = Enum.KeyCode.ButtonX, 
        type = "Button", 
        Position = UDim2.new(0.678, 0, 0.468, 0), 
        Size = UDim2.new(0.051, 0, 0.051, 0)
    }, 
    ButtonY = {
        keyCode = Enum.KeyCode.ButtonY, 
        type = "Button", 
        Position = UDim2.new(0.743, 0, 0.41, 0), 
        Size = UDim2.new(0.051, 0, 0.051, 0)
    }, 
    ButtonB = {
        keyCode = Enum.KeyCode.ButtonB, 
        type = "Button", 
        Position = UDim2.new(0.806, 0, 0.458, 0), 
        Size = UDim2.new(0.051, 0, 0.051, 0)
    }, 
    ButtonA = {
        keyCode = Enum.KeyCode.ButtonA, 
        type = "Button", 
        Position = UDim2.new(0.741, 0, 0.52, 0), 
        Size = UDim2.new(0.051, 0, 0.051, 0)
    }, 
    AbxyMappings = {
        upKeyName = "Y", 
        downKeyName = "A", 
        leftKeyName = "X", 
        rightKeyName = "B", 
        type = "CrossLayoutMappings", 
        side = "Right", 
        Position = UDim2.new(1.02, 0, 0.608, 0), 
        arrowDestination = UDim2.new(0.75, 0, 0.47, 0), 
        arrowBendPoint = 0.5
    }, 
    ButtonSelect = {
        keyCode = Enum.KeyCode.ButtonSelect, 
        type = "Button", 
        Position = UDim2.new(0.433, 0, 0.467, 0), 
        Size = UDim2.new(0.035, 0, 0.035, 0)
    }, 
    ButtonSelectLabel = {
        keyName = "Select", 
        type = "ButtonMapping", 
        side = "Left", 
        Position = UDim2.new(0.039, 0, 0.359, 0), 
        arrowDestination = UDim2.new(0.436, 0, 0.469, 0), 
        arrowBendPoint = 0.75
    }, 
    ButtonStart = {
        keyCode = Enum.KeyCode.ButtonStart, 
        type = "Button", 
        Position = UDim2.new(0.569, 0, 0.467, 0), 
        Size = UDim2.new(0.035, 0, 0.035, 0)
    }, 
    ButtonStartLabel = {
        keyName = "Start", 
        type = "ButtonMapping", 
        side = "Right", 
        Position = UDim2.new(0.965, 0, 0.359, 0), 
        arrowDestination = UDim2.new(0.57, 0, 0.469, 0), 
        arrowBendPoint = 0.75
    }, 
    ButtonL1 = {
        keyCode = Enum.KeyCode.ButtonL1, 
        type = "Button", 
        Position = UDim2.new(0.276, 0, 0.3, 0), 
        Size = UDim2.new(0.16, 0, 0.04, 0)
    }, 
    ButtonL1Label = {
        keyName = "L1", 
        type = "ButtonMapping", 
        side = "Left", 
        Position = UDim2.new(0.031, 0, 0.276, 0), 
        arrowDestination = UDim2.new(0.241, 0, 0.292, 0), 
        arrowBendPoint = 0.8
    }, 
    ButtonL2 = {
        keyCode = Enum.KeyCode.ButtonL2, 
        type = "Button", 
        Position = UDim2.new(0.241, 0, 0.235, 0), 
        Size = UDim2.new(0.07, 0, 0.063, 0)
    }, 
    ButtonL2Label = {
        keyName = "L2", 
        type = "ButtonMapping", 
        side = "Left", 
        Position = UDim2.new(0.031, 0, 0.176, 0), 
        arrowDestination = UDim2.new(0.247, 0, 0.222, 0), 
        arrowBendPoint = 0.7
    }, 
    TriggerL2 = {
        keyCode = Enum.KeyCode.ButtonL2, 
        type = "Trigger", 
        Position = UDim2.new(0.25, 0, 0.052, 0), 
        Size = UDim2.new(0.069, 0, 0.1, 0)
    }, 
    ButtonR1 = {
        keyCode = Enum.KeyCode.ButtonR1, 
        type = "Button", 
        Position = UDim2.new(0.723, 0, 0.3, 0), 
        Size = UDim2.new(0.16, 0, 0.04, 0)
    }, 
    ButtonR1Label = {
        keyName = "R1", 
        type = "ButtonMapping", 
        side = "Right", 
        Position = UDim2.new(0.97, 0, 0.276, 0), 
        arrowDestination = UDim2.new(0.765, 0, 0.292, 0), 
        arrowBendPoint = 0.8
    }, 
    ButtonR2 = {
        keyCode = Enum.KeyCode.ButtonR2, 
        type = "Button", 
        Position = UDim2.new(0.765, 0, 0.235, 0), 
        Size = UDim2.new(0.07, 0, 0.063, 0)
    }, 
    ButtonR2Label = {
        keyName = "R2", 
        type = "ButtonMapping", 
        side = "Right", 
        Position = UDim2.new(0.981, 0, 0.176, 0), 
        arrowDestination = UDim2.new(0.75, 0, 0.222, 0), 
        arrowBendPoint = 0.7
    }, 
    TriggerR2 = {
        keyCode = Enum.KeyCode.ButtonR2, 
        type = "Trigger", 
        Position = UDim2.new(0.75, 0, 0.052, 0), 
        Size = UDim2.new(0.069, 0, 0.1, 0)
    }
};
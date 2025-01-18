return {
    getFFlagEnableControlsEmulator = function() --[[ Line: 3 ]] --[[ Name: getFFlagEnableControlsEmulator ]]
        return game:GetEngineFeature("EnableControlsEmulator");
    end, 
    getFFlagEnableVRControllers = function() --[[ Line: 6 ]] --[[ Name: getFFlagEnableVRControllers ]]
        return game:GetEngineFeature("EnableVRControllers");
    end, 
    getFFlagEnableGrayHoverDeviceEmulator = function() --[[ Line: 9 ]] --[[ Name: getFFlagEnableGrayHoverDeviceEmulator ]]
        return game:GetEngineFeature("EnableGrayHoverDeviceEmulator");
    end
};
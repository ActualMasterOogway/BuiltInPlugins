local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
return (require(l_script_FirstAncestor_0.Packages.React).createContext({
    connectGamepadId = nil, 
    setMapping = nil, 
    loadMappingsForGamepad = nil, 
    setIsUpdatingMappingFor = nil, 
    restoreDefaults = nil, 
    saveMappings = nil, 
    setIsMappingsDialogOpen = nil, 
    setVRConnected = nil, 
    changeEmulatedDevice = nil, 
    DEPRECATED_setVRActiveUserCFrame = nil, 
    setVRUserCFrameActive = nil
}));
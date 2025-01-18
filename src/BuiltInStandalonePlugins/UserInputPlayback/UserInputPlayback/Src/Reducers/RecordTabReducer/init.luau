local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetScreenSize);
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceId);
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceOrientation);
local v6 = {
    screenSize = Vector2.new(), 
    emulationDeviceId = "Unknown", 
    emulationDeviceOrientation = "Unknown"
};
return v1.createReducer(v6, {
    SetScreenSize = function(v7, v8) --[[ Line: 23 ]] --[[ Name: SetScreenSize ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v7, {
            screenSize = v8.screenSize
        });
    end, 
    SetEmulationDeviceId = function(v9, v10) --[[ Line: 28 ]] --[[ Name: SetEmulationDeviceId ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v9, {
            emulationDeviceId = v10.emulationDeviceId
        });
    end, 
    SetEmulationDeviceOrientation = function(v11, v12) --[[ Line: 33 ]] --[[ Name: SetEmulationDeviceOrientation ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v11, {
            emulationDeviceOrientation = v12.orientation
        });
    end
});
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetEnabled);
local v5 = require(l_Actions_0.SetErrorText);
local v6 = require(l_Actions_0.SetMode);
local v7 = require(l_Actions_0.SetScreen);
local v8 = require(l_Actions_0.SetRig);
local v9 = require(l_Actions_0.SetAccessoryType);
local v10 = require(l_Actions_0.SetAnimationId);
local v11 = require(l_Actions_0.SetSurfaceAppearanceIds);
local v12 = require(l_Actions_0.SetOwnershipTransferText);
return (v1.createReducer({
    enabled = false, 
    mode = nil, 
    screen = nil, 
    rig = nil, 
    errorText = nil, 
    accessoryType = Enum.AccessoryType.Unknown, 
    animationId = nil, 
    colorMap = nil, 
    metalnessMap = nil, 
    normalMap = nil, 
    roughnessMap = nil, 
    ownershipTransferText = ""
}, {
    [v4.name] = function(v13, v14) --[[ Line: 32 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v13, {
            enabled = v14.enabled
        });
    end, 
    [v5.name] = function(v15, v16) --[[ Line: 38 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v15, {
            errorText = v16.errorText
        });
    end, 
    [v6.name] = function(v17, v18) --[[ Line: 44 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v17, {
            mode = v18.mode
        });
    end, 
    [v7.name] = function(v19, v20) --[[ Line: 50 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v19, {
            screen = v20.screen
        });
    end, 
    [v8.name] = function(v21, v22) --[[ Line: 56 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v21, {
            rig = v22.rig
        });
    end, 
    [v11.name] = function(v23, v24) --[[ Line: 62 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v23, {
            colorMap = v24.colorMap, 
            metalnessMap = v24.metalnessMap, 
            normalMap = v24.normalMap, 
            roughnessMap = v24.roughnessMap
        });
    end, 
    [v9.name] = function(v25, v26) --[[ Line: 71 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v25, {
            accessoryType = v26.accessoryType
        });
    end, 
    [v10.name] = function(v27, v28) --[[ Line: 77 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v27, {
            animationId = v28.animationId
        });
    end, 
    [v12.name] = function(v29, v30) --[[ Line: 83 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v29, {
            ownershipTransferText = v30.ownershipTransferText
        });
    end
}));
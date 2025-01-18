local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.enumToDisplayKeyCode);
local l_Localization_0 = v2.ContextServices.Localization;
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v7 = v2.Util.LayoutOrderIterator.new();
local l_GAMEPAD_TYPE_TO_ID_0 = require(l_script_FirstAncestor_0.Src.Util.Constants).GAMEPAD_TYPE_TO_ID;
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
return v1.memo(function(v10) --[[ Line: 29 ]] --[[ Name: MappingsListRow ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v5 (copy), v6 (copy), l_GAMEPAD_TYPE_TO_ID_0 (copy), v7 (copy), v3 (copy)
    local v11 = l_Localization_0:use();
    local v12 = v1.useContext(v5);
    local v13 = v1.useContext(v6);
    local v14 = false;
    if v12.isUpdatingMappingForKey ~= nil then
        v14 = v12.isUpdatingMappingForKey == v10.keyName;
    end;
    local v15 = v11:getText("MappingsListRow", "PressKeysLabel");
    local l_isUpdatingMappingForGamepadId_0 = v12.isUpdatingMappingForGamepadId;
    local v17 = v12.mappings[l_isUpdatingMappingForGamepadId_0] or {};
    local v18 = v1.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: l_isUpdatingMappingForGamepadId_0 (copy), l_GAMEPAD_TYPE_TO_ID_0 (ref), v10 (copy)
        if l_isUpdatingMappingForGamepadId_0 == l_GAMEPAD_TYPE_TO_ID_0.PS4 or l_isUpdatingMappingForGamepadId_0 == l_GAMEPAD_TYPE_TO_ID_0.PS5 then
            if v10.keyName == "Y" then
                return "\226\150\179";
            elseif v10.keyName == "X" then
                return "\226\152\144";
            elseif v10.keyName == "B" then
                return "O";
            elseif v10.keyName == "A" then
                return "X";
            end;
        end;
        return v10.keyName;
    end, {
        l_isUpdatingMappingForGamepadId_0, 
        v10.keyName
    });
    local v19 = v1.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v10 (copy)
        if v10.onHover then
            v10.onHover(v10.keyName);
        end;
    end, {
        v10.onHover, 
        v10.keyName
    });
    local v20 = v1.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v10 (copy)
        if v10.onHover then
            v10.onHover(nil);
        end;
    end, {
        v10.onHover
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-MappingsListRow X-RowS CX-Invisible", 
        LayoutOrder = v10.LayoutOrder
    }, {
        DestKey = v1.createElement("TextButton", {
            [v1.Tag] = "DestKey CX-Invisible", 
            Text = v18, 
            LayoutOrder = v7:getNextOrder(), 
            [v1.Event.MouseEnter] = v20
        }), 
        SrcKey = v1.createElement("TextButton", {
            [v1.Tag] = "SrcKey", 
            Text = if v14 then v15 else v3(v17[v10.keyName]), 
            LayoutOrder = v7:getNextOrder(), 
            [v1.Event.Activated] = function() --[[ Line: 95 ]]
                -- upvalues: v13 (copy), l_isUpdatingMappingForGamepadId_0 (copy), v10 (copy)
                if v13.setIsUpdatingMappingFor then
                    v13.setIsUpdatingMappingFor(l_isUpdatingMappingForGamepadId_0, v10.keyName);
                end;
            end, 
            [v1.Event.MouseEnter] = v19
        })
    });
end);
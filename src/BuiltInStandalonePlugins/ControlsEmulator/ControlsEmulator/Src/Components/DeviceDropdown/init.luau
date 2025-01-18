local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
local l_DropdownMenu_0 = v2.UI.DropdownMenu;
local v6 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ZIndexData_0 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants).ZIndexData;
local v8 = Vector2.new(200, 40);
return v1.memo(function(v9) --[[ Line: 24 ]] --[[ Name: DeviceDropdown ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v6 (copy), v8 (copy), l_ZIndexData_0 (copy), l_joinTags_0 (copy), l_DropdownMenu_0 (copy)
    local v10 = l_Localization_0:use();
    local v11 = v1.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v10 (copy)
        return {
            [101] = v10:getText("DeviceDropdown", "GenericGamepad"), 
            [102] = v10:getText("DeviceDropdown", "PS4"), 
            [103] = v10:getText("DeviceDropdown", "PS5"), 
            [104] = v10:getText("DeviceDropdown", "Xbox"), 
            [105] = v10:getText("DeviceDropdown", "Quest2"), 
            [106] = v10:getText("DeviceDropdown", "Quest3")
        };
    end, {
        v9.selectedGamepadId, 
        v9.deviceIds, 
        v10.getText, 
        v10.getLocale
    });
    local v14 = v1.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v6 (ref), v11 (copy)
        return v6.reduce(v6.keys(v11), function(v12, v13) --[[ Line: 39 ]]
            -- upvalues: v11 (ref)
            v12[v11[v13]] = v13;
            return v12;
        end, {});
    end, {
        v11
    });
    local v15, v16 = v1.useState(false);
    local v17, v18 = v1.useState(v8);
    local v19 = v1.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy)
        return v17.X;
    end, {
        v17
    });
    local v23 = v1.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v6 (ref), v9 (copy), v11 (copy)
        local v22 = v6.reduce(v9.deviceIds, function(v20, v21) --[[ Line: 54 ]]
            -- upvalues: v11 (ref)
            table.insert(v20, v11[v21]);
            return v20;
        end, {});
        table.sort(v22);
        return v22;
    end, {
        v9.deviceIds
    });
    local v25 = v1.useCallback(function(v24) --[[ Line: 63 ]]
        -- upvalues: v16 (copy), v9 (copy), v14 (copy)
        v16(false);
        if v9.onChanged then
            v9.onChanged(v14[v24]);
        end;
    end, {
        v9.onChanged
    });
    local v26 = v1.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy)
        v16(false);
    end, {
        v16
    });
    local v27 = v1.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v16 (copy)
        v16(true);
    end, {
        v16
    });
    local v29 = v1.useCallback(function(v28) --[[ Line: 78 ]]
        -- upvalues: v18 (copy)
        v18(v28.AbsoluteSize);
    end, {
        v18
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-DeviceDropdown data-testid=Component-DeviceDropdown", 
        LayoutOrder = v9.LayoutOrder, 
        [v1.Change.AbsoluteSize] = v29
    }, {
        Selected = v1.createElement("TextButton", {
            [v1.Tag] = "X-Fill CX-Invisible data-testid=DeviceDropdown-SelectedDeviceButton", 
            Text = v11[v9.selectedGamepadId], 
            ZIndex = l_ZIndexData_0.DEVICEDROPDOWN_TEXTBUTTON, 
            [v1.Event.Activated] = v27
        }), 
        ButtonContainer = v1.createElement("Frame", {
            [v1.Tag] = "CX-Invisible", 
            ZIndex = l_ZIndexData_0.DEVICEDROPDOWN_IMAGEBUTTON
        }, {
            OpenSelectorButton = v1.createElement("ImageButton", {
                [v1.Tag] = l_joinTags_0(v15 and "Close" or "Open", "data-testid=DeviceDropdown-DropdownImageButton"), 
                [v1.Event.Activated] = v27
            })
        }), 
        Menu = v1.createElement(l_DropdownMenu_0, {
            [v1.Tag] = "DeviceDropdownMenu", 
            Items = v23, 
            Width = v19, 
            Hide = not v15, 
            OnItemActivated = v25, 
            OnFocusLost = v26
        })
    });
end);
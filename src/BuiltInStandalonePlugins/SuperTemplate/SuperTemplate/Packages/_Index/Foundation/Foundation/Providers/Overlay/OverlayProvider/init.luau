local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v2 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer:WaitForChild("PlayerGui") else nil;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.Utility.isCoreGui);
local v6 = require(script.Parent.OverlayContext);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.ReactRoblox);
local v9 = if v5 then l_CoreGui_0 else v2;
return function(v10) --[[ Line: 21 ]] --[[ Name: OverlayProvider ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (copy), v8 (copy)
    local v11, v12 = v7.useState(v10.gui);
    local v14 = v7.useCallback(function(v13) --[[ Line: 24 ]]
        -- upvalues: v12 (copy)
        v12(v13);
    end, {});
    v7.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v12 (copy)
        if v10.gui ~= nil then
            v12(v10.gui);
        end;
    end, {
        v10.gui
    });
    return v7.createElement(v6.Provider, {
        value = {
            overlay = v11
        }
    }, {
        FoundationOverlay = if not v10.gui and v9 then v8.createPortal(v7.createElement("ScreenGui", {
            Enabled = true, 
            DisplayOrder = 1e999, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets, 
            ref = v14
        }), v9) else nil, 
        Children = v7.createElement(v7.Fragment, nil, v10.children)
    });
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Utility.Logger);
local v6 = require(l_script_FirstAncestor_0.Components.Interactable);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v10 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v11 = require(l_script_FirstAncestor_0.Utility.useStyledDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v15 = {
    layout = {
        SortOrder = Enum.SortOrder.LayoutOrder
    }, 
    AutoLocalize = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v16, v17) --[[ Line: 44 ]] --[[ Name: View ]]
    -- upvalues: v2 (copy), v11 (copy), v15 (copy), v8 (copy), v9 (copy), v13 (copy), v3 (copy), v5 (copy), v10 (copy), v6 (copy), v4 (copy), v12 (copy)
    local v18 = if v2.FoundationStylingPolyfill then v11("View", v16.tag, "gui-object-defaults", v15) else nil;
    local v19 = v8(v16, if v2.FoundationStylingPolyfill then v18 else v15);
    local v20 = v9(v19.tag, "gui-object-defaults");
    local v21 = v13(v20);
    local v22 = true;
    if v19.onStateChanged == nil then
        v22 = v19.onActivated ~= nil;
    end;
    local v23 = v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy)
        if v19.GroupTransparency ~= nil then
            if type(v19.GroupTransparency) == "table" then
                return true;
            else
                return v19.GroupTransparency > 0;
            end;
        else
            return false;
        end;
    end, {
        v19.GroupTransparency
    });
    local v24 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v23 (copy), v22 (copy), v19 (copy), v5 (ref)
        if v23 then
            if v22 and not v19.isDisabled then
                v5:warning("Some state changes are not supported with GroupTransparency");
            end;
            return "CanvasGroup";
        elseif v22 then
            return "ImageButton";
        else
            return "Frame";
        end;
    end, {
        v23, 
        v22
    });
    local v25 = v10(v19, {
        AutoButtonColor = v24 ~= "ImageButton" and nil, 
        GroupTransparency = if v23 then v19.GroupTransparency else nil, 
        ref = v17, 
        [v3.Tag] = v21
    });
    local v26 = if v22 then v6 else v24;
    local v27 = if v22 then v4.Dictionary.union(v25, {
        component = v24, 
        onActivated = v19.onActivated, 
        onStateChanged = v19.onStateChanged, 
        stateLayer = v19.stateLayer, 
        isDisabled = v19.isDisabled
    }) else v25;
    return v3.createElement(v26, v27, v12(v19));
end));
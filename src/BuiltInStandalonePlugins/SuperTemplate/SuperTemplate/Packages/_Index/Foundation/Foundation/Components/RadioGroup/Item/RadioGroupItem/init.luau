local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.InputLabel);
local v5 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v7 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v12 = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local v14 = require(script.Parent.Parent.useCheckedValue);
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 38 ]] --[[ Name: RadioGroupItem ]]
    -- upvalues: v2 (copy), v14 (copy), v8 (copy), v9 (copy), v12 (copy), v5 (copy), v10 (copy), v7 (copy), v4 (copy), v11 (copy)
    local v17, v18 = v2.useBinding(false);
    local v19, v20 = v14();
    local v21 = v19 == v15.value;
    local v22 = v15.label or v15.value;
    local v23 = v8();
    local v24 = v9({
        radius = UDim.new(0, v23.Radius.Small), 
        offset = v23.Size.Size_200, 
        borderWidth = v23.Stroke.Thicker
    });
    local v26 = v2.useCallback(function(v25) --[[ Line: 52 ]]
        -- upvalues: v15 (copy), v23 (copy)
        if v25 and not v15.isDisabled then
            return v23.Color.Content.Emphasis;
        else
            return v23.Color.Content.Default;
        end;
    end, {
        v23, 
        v21, 
        v15.isDisabled
    });
    local v27 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v15 (copy), v20 (copy)
        if not v15.isDisabled then
            v20(v15.value);
        end;
    end, {
        v15.isDisabled, 
        v15.value, 
        v20
    });
    local v29 = v2.useCallback(function(v28) --[[ Line: 66 ]]
        -- upvalues: v18 (copy), v12 (ref)
        v18(v28 == v12.Hover);
    end, {});
    local v30 = v23.Size.Size_600 - math.ceil(v23.Stroke.Standard) * 2;
    local v33 = v2.createElement(v5, {
        Size = UDim2.new(0, v30, 0, v30), 
        stroke = {
            Color = v17:map(function(v31) --[[ Line: 75 ]]
                -- upvalues: v26 (copy)
                return v26(v31).Color3;
            end), 
            Transparency = v17:map(function(v32) --[[ Line: 78 ]]
                -- upvalues: v26 (copy)
                return v26(v32).Transparency;
            end)
        }, 
        tag = "radius-circle stroke-standard"
    }, {
        Center = if v21 then v2.createElement(v5, {
            tag = "position-center-center anchor-center-center radius-circle size-400 bg-action-sub-emphasis"
        }) else nil
    });
    return v2.createElement(v5, v10(v15, {
        Active = not v15.isDisabled, 
        GroupTransparency = v15.isDisabled and 0.5 or 0, 
        isDisabled = v15.isDisabled, 
        onActivated = v27, 
        onStateChanged = v29, 
        selection = {
            Selectable = not v15.isDisabled, 
            SelectionImageObject = v24
        }, 
        stateLayer = {
            affordance = v7.None
        }, 
        padding = {
            top = UDim.new(0, (math.ceil(v23.Stroke.Standard))), 
            bottom = UDim.new(0, (math.ceil(v23.Stroke.Standard))), 
            left = UDim.new(0, (math.ceil(v23.Stroke.Standard)))
        }, 
        tag = "row gap-small auto-xy align-x-left align-y-center", 
        ref = v16
    }), {
        RadioGroupItem = v33, 
        Label = if type(v22) == "string" then v2.createElement(v4, {
            Text = v22, 
            textStyle = v17:map(function(v34) --[[ Line: 123 ]]
                -- upvalues: v26 (copy)
                return v26(v34);
            end), 
            size = v11.Large, 
            LayoutOrder = 2
        }) else v22
    });
end));
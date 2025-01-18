local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.Image);
local v6 = require(l_Components_0.InputLabel);
local v7 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v11 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(script.Parent.useCheckboxVariants);
local v15 = require(l_script_FirstAncestor_0.Enums.CheckboxSize);
local v16 = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local v18 = {
    size = v15.Large
};
return v2.memo(v2.forwardRef(function(v19, v20) --[[ Line: 50 ]] --[[ Name: Checkbox ]]
    -- upvalues: v13 (copy), v18 (copy), v2 (copy), v10 (copy), v11 (copy), v16 (copy), v14 (copy), v9 (copy), v7 (copy), v3 (copy), v5 (copy), v12 (copy), v6 (copy)
    local v21 = v13(v19, v18);
    local v22 = #v21.label > 0;
    local v23, v24 = v2.useState(false);
    local v25 = v10();
    local v26, v27 = v2.useState(v21.isChecked or false);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v21 (copy), v27 (copy)
        if v21.isChecked ~= nil then
            v27(v21.isChecked);
        end;
    end, {
        v21.isChecked
    });
    local v28 = v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v22 (copy), v25 (copy)
        return {
            radius = if v22 then UDim.new(0, v25.Radius.Small) else UDim.new(0, 0), 
            offset = v25.Size.Size_200, 
            borderWidth = v25.Stroke.Thicker
        };
    end, {
        v25, 
        v22
    });
    local v29 = v11(v28);
    local v30 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v26 (copy), v23 (copy), v16 (ref)
        if v26 then
            return "Checked";
        elseif v23 then
            return v16.Hover;
        else
            return v16.Default;
        end;
    end, {
        v26, 
        v23
    });
    local v31 = v14(v25, v21.size, v30);
    local v33 = v2.useCallback(function(v32) --[[ Line: 85 ]]
        -- upvalues: v24 (copy), v16 (ref)
        v24(v32 == v16.Hover);
    end, {});
    local v34 = {
        Active = not v21.isDisabled, 
        onActivated = function() --[[ Line: 91 ]] --[[ Name: onActivated ]]
            -- upvalues: v21 (copy), v27 (copy), v26 (copy)
            if not v21.isDisabled then
                if v21.isChecked == nil then
                    v27(not v26);
                end;
                v21.onActivated(not v26);
            end;
        end, 
        onStateChanged = v33, 
        stateLayer = {
            affordance = v9.None
        }, 
        selection = {
            Selectable = not v21.isDisabled, 
            SelectionImageObject = v29
        }, 
        isDisabled = v21.isDisabled, 
        ref = v20
    };
    local v35 = v2.createElement(v7, v3.Dictionary.union({
        tag = v31.checkbox.tag, 
        Size = v31.checkbox.size, 
        stroke = {
            Color = v31.checkbox.stroke.Color3, 
            Transparency = v31.checkbox.stroke.Transparency
        }
    }, if not v22 then v34 else {}), {
        Checkmark = if v21.isChecked then v2.createElement(v5, {
            Image = "icons/status/success_small", 
            tag = v31.checkmark.tag
        }) else nil
    });
    if not v22 then
        return v35;
    else
        return v2.createElement(v7, v12(v21, v3.Dictionary.union({
            GroupTransparency = v21.isDisabled and 0.5 or 0, 
            padding = v31.container.padding, 
            tag = v31.container.tag
        }, v34)), {
            Checkbox = v35, 
            InputLabel = v2.createElement(v6, {
                Text = v21.label, 
                textStyle = v31.label.style, 
                size = v31.label.size, 
                LayoutOrder = 2
            })
        });
    end;
end));
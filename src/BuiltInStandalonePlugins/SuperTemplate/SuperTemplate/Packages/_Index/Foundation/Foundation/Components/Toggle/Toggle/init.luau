local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_Components_0.Image);
local v7 = require(l_Components_0.InputLabel);
local v8 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v10 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(l_script_FirstAncestor_0.Utility.lerp);
local v15 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v16 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v17 = require(script.Parent.useToggleVariants);
local v18 = require(l_script_FirstAncestor_0.Enums.ToggleSize);
local _ = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v20 = {
    frequency = 4
};
local function _(v21, v22) --[[ Line: 42 ]] --[[ Name: divideTransparency ]]
    return 1 - (1 - v21) / v22;
end;
local v24 = {
    size = v18.Large
};
return v3.memo(v3.forwardRef(function(v25, v26) --[[ Line: 65 ]] --[[ Name: Toggle ]]
    -- upvalues: v13 (copy), v24 (copy), v11 (copy), v17 (copy), v3 (copy), v10 (copy), v14 (copy), v2 (copy), v16 (copy), v20 (copy), v15 (copy), v8 (copy), v12 (copy), v4 (copy), v6 (copy), v7 (copy)
    local v27 = v13(v25, v24);
    local v28 = v11();
    local v29 = v17(v28, v27.size);
    local v30, v31 = v3.useState(v27.isChecked or false);
    v3.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v27 (copy), v31 (copy)
        if v27.isChecked ~= nil then
            v31(v27.isChecked);
        end;
    end, {
        v27.isChecked
    });
    local v32 = #v27.label > 0;
    local v33 = v3.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v32 (copy), v28 (copy)
        return {
            radius = if v32 then UDim.new(0, v28.Radius.Small) else UDim.new(0.5, 0), 
            offset = v28.Size.Size_200, 
            borderWidth = v28.Stroke.Thicker
        };
    end, {
        v28, 
        v32
    });
    local v34 = v10(v33);
    local v35 = v30 and 1 or 0;
    local v36, v37 = v3.useBinding(false);
    local v38, v39 = v3.useBinding(v35);
    local v40 = v3.useRef(nil);
    local v41 = v27.isDisabled and 2 or 1;
    local l_Background_0 = v28.Color.ActionEmphasis.Background;
    local v46 = v3.useCallback(function(v43) --[[ Line: 96 ]]
        -- upvalues: v41 (copy)
        local l_Transparency_0 = v43.Transparency;
        local l_v41_0 = v41;
        return 1 - (1 - l_Transparency_0) / l_v41_0;
    end, {
        v28, 
        v27.isDisabled
    });
    local v49 = v3.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_Background_0 (copy), v41 (copy)
        local l_Transparency_1 = l_Background_0.Transparency;
        local l_v41_1 = v41;
        return 1 - (1 - l_Transparency_1) / l_v41_1;
    end, {
        v28, 
        v27.isDisabled
    });
    local v51 = v3.useCallback(function(v50) --[[ Line: 103 ]]
        -- upvalues: v27 (copy), v28 (copy)
        if v50 and not v27.isDisabled then
            return v28.Color.Content.Emphasis;
        else
            return v28.Color.Content.Default;
        end;
    end, {
        v28, 
        v27.isDisabled
    });
    local v54 = v36:map(function(v52) --[[ Line: 112 ]]
        -- upvalues: v30 (copy), l_Background_0 (copy), v51 (copy), v46 (copy)
        local v53 = if v30 then l_Background_0 else v51(v52);
        return {
            Color3 = v53.Color3, 
            Transparency = v46(v53)
        };
    end);
    local v56 = v38:map(function(v55) --[[ Line: 120 ]]
        -- upvalues: l_Background_0 (copy), v14 (ref), v46 (copy)
        return {
            Color3 = l_Background_0.Color3, 
            Transparency = v14(1, v46(l_Background_0), v55)
        };
    end);
    local v58 = v38:map(function(v57) --[[ Line: 127 ]]
        -- upvalues: v29 (copy)
        return v29.knob.offPosition:Lerp(v29.knob.onPosition, v57);
    end);
    v3.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v2 (ref), v35 (copy), v40 (copy), v39 (copy)
        local v59 = v2.createSingleMotor(v35);
        v40.current = v59;
        v59:start();
        v59:onStep(function(v60) --[[ Line: 136 ]]
            -- upvalues: v39 (ref)
            v39(v60);
        end);
        return function() --[[ Line: 140 ]]
            -- upvalues: v59 (copy)
            v59:destroy();
        end;
    end, {});
    local v62 = v3.useCallback(function(v61) --[[ Line: 145 ]]
        -- upvalues: v37 (copy), v16 (ref)
        v37(v61 == v16.Hover);
    end, {});
    v3.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v30 (copy), v40 (copy), v2 (ref), v20 (ref)
        local v63 = v30 and 1 or 0;
        if v40.current then
            v40.current:setGoal(v2.spring(v63, v20));
        end;
    end, {
        v30
    });
    local v64 = {
        onActivated = v3.useCallback(function() --[[ Line: 156 ]]
            -- upvalues: v27 (copy), v31 (copy), v30 (copy)
            if not v27.isDisabled then
                if v27.isChecked == nil then
                    v31(not v30);
                end;
                v27.onActivated(not v30);
            end;
        end, {
            v27.onActivated, 
            v27.isChecked, 
            v30, 
            v27.isDisabled, 
            v31
        }), 
        onStateChanged = v62, 
        stateLayer = {
            affordance = v15.None
        }, 
        selection = {
            Selectable = not v27.isDisabled, 
            SelectionImageObject = v34
        }, 
        ref = v26
    };
    local v68 = v3.createElement(v8, v12(v27, v4.Dictionary.union({
        Active = not v27.isDisabled, 
        Size = v29.toggle.size, 
        stroke = {
            Color = v54:map(function(v65) --[[ Line: 184 ]]
                return v65.Color3;
            end), 
            Transparency = v54:map(function(v66) --[[ Line: 187 ]]
                return v66.Transparency;
            end), 
            Thickness = v28.Stroke.Standard
        }, 
        cornerRadius = v29.toggle.cornerRadius, 
        backgroundStyle = v56, 
        isDisabled = v27.isDisabled
    }, if not v32 then v64 else {})), {
        Knob = v3.createElement(v8, {
            backgroundStyle = if v27.isDisabled then v28.Color.Extended.Gray.Gray_500 else v28.Color.Extended.White.White_100, 
            Size = v29.knob.size, 
            Position = v58, 
            ZIndex = 4, 
            tag = v29.knob.tag
        }), 
        KnobShadow = v3.createElement(v6, {
            Image = "component_assets/dropshadow_28", 
            imageStyle = {
                Transparency = v49
            }, 
            Size = v29.knobShadow.size, 
            Position = v58:map(function(v67) --[[ Line: 213 ]]
                -- upvalues: v29 (copy)
                return UDim2.new(v67.X.Scale, v67.X.Offset - v29.knobShadow.padding, v67.Y.Scale, v67.Y.Offset);
            end), 
            ZIndex = 3, 
            tag = v29.knobShadow.tag
        })
    });
    if not v32 then
        return v68;
    else
        return v3.createElement(v8, v4.Dictionary.union({
            tag = "row gap-small auto-xy align-x-left align-y-center", 
            isDisabled = v27.isDisabled
        }, v64), {
            InputLabel = v3.createElement(v7, {
                Text = v27.label, 
                textStyle = v36:map(v51), 
                size = v29.label.size, 
                LayoutOrder = 0
            }), 
            Toggle = v68
        });
    end;
end));
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Utility.Control.useGuiControlState);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(script.Parent.getOriginalBackgroundStyle);
local v11 = require(script.Parent.getBackgroundStyleWithStateLayer);
local v12 = require(script.Parent.getStateLayerStyle);
local v13 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local _ = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v15 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v16 = {
    component = "ImageButton", 
    isDisabled = false, 
    userInteractionEnabled = true
};
local v17 = Color3.fromRGB(163, 162, 165);
return v3.memo(v3.forwardRef(function(v18, v19) --[[ Line: 47 ]] --[[ Name: Interactable ]]
    -- upvalues: v7 (copy), v16 (copy), v3 (copy), v9 (copy), v8 (copy), v15 (copy), v17 (copy), v10 (copy), v13 (copy), v12 (copy), v11 (copy), v4 (copy), v6 (copy), v2 (copy)
    local v20 = v7(v18, v16);
    local v21 = v3.useRef(nil);
    local v22 = v9();
    local v23 = v8();
    local v24, v25 = v3.useBinding(v15.Initialize);
    local v26 = v3.useRef(nil);
    local v28 = v3.useCallback(function(v27) --[[ Line: 55 ]]
        -- upvalues: v24 (copy), v15 (ref), v21 (copy), v17 (ref), v26 (copy), v25 (copy), v20 (copy)
        if v24:getValue() == v15.Default and v21.current ~= nil and (v21.current.BackgroundColor3 ~= v17 or v21.current.Transparency ~= 0) then
            v26.current = {
                Color3 = v21.current.BackgroundColor3, 
                Transparency = v21.current.BackgroundTransparency
            };
        end;
        v25(v27);
        if v20.onStateChanged ~= nil then
            v20.onStateChanged(v27);
        end;
    end, {
        v20.onStateChanged
    });
    local v29 = v3.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy)
        if not v20.isDisabled and v20.userInteractionEnabled and v20.onActivated ~= nil then
            v20.onActivated();
        end;
    end, {
        v20.isDisabled, 
        v20.onActivated
    });
    local v30 = v3.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v10 (ref), v20 (copy)
        return v10(v20.BackgroundColor3, v20.BackgroundTransparency);
    end, {
        v20.BackgroundColor3, 
        v20.BackgroundTransparency
    });
    local v36 = v3.useCallback(function(v31, v32, _) --[[ Line: 81 ]]
        -- upvalues: v15 (ref), v20 (copy), v13 (ref), v26 (copy), v12 (ref), v22 (copy), v11 (ref)
        if v31 == v15.Initialize or v31 == v15.Default or v31 == v15.Disabled or v20.stateLayer and v20.stateLayer.affordance == v13.None then
            return v32;
        else
            local v34 = {
                Color3 = v32.Color3, 
                Transparency = v32.Transparency
            };
            if v32.Color3 == nil then
                v34.Color3 = if v26.current then v26.current.Color3 else nil;
            end;
            if v32.Transparency == nil then
                v34.Transparency = if v26.current then v26.current.Transparency else nil;
            end;
            local v35 = v12(v22, v20.stateLayer, v31);
            return v11(v34, v35);
        end;
    end, {
        v20.isDisabled, 
        v22, 
        v20.BackgroundColor3, 
        v20.BackgroundTransparency, 
        v20.stateLayer
    });
    local v39 = v3.useMemo(function() --[[ Line: 120 ]]
        -- upvalues: v4 (ref), v30 (copy), v3 (ref), v24 (copy), v36 (copy), v20 (copy)
        if v4.isBinding(v30) then
            return v3.joinBindings({
                controlState = v24, 
                backgroundStyle = v30
            }):map(function(v37) --[[ Line: 123 ]]
                -- upvalues: v36 (ref), v20 (ref)
                return v36(v37.controlState, v37.backgroundStyle, v20.isDisabled);
            end);
        else
            return v24:map(function(v38) --[[ Line: 128 ]]
                -- upvalues: v36 (ref), v30 (ref), v20 (ref)
                return v36(v38, v30, v20.isDisabled);
            end);
        end;
    end, {
        v30, 
        v24, 
        v36, 
        v20.isDisabled
    });
    local v40, v41 = v6(v21, v28, v20.userInteractionEnabled);
    v3.useImperativeHandle(v19, function() --[[ Line: 138 ]]
        -- upvalues: v21 (copy)
        return v21.current;
    end, {});
    v3.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v20 (copy), v41 (copy)
        if v20.isDisabled then
            v41.events.Disabled();
            return;
        else
            v41.events.Enabled();
            return;
        end;
    end, {
        v20.isDisabled, 
        v41
    });
    local v44 = v2.Dictionary.union(v20, {
        BackgroundColor3 = v39:map(function(v42) --[[ Line: 151 ]]
            return v42.Color3;
        end), 
        BackgroundTransparency = v39:map(function(v43) --[[ Line: 154 ]]
            return v43.Transparency;
        end), 
        Active = not v20.isDisabled, 
        [v3.Event.Activated] = if not v20.isDisabled then v29 else nil, 
        ref = v40, 
        SelectionImageObject = v20.SelectionImageObject or v23
    });
    v44.component = nil;
    v44.isDisabled = nil;
    v44.userInteractionEnabled = nil;
    v44.onActivated = nil;
    v44.onStateChanged = nil;
    v44.stateLayer = nil;
    return v3.createElement(v20.component, v44);
end));
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.InputLabel);
local v6 = require(l_Components_0.HintText);
local v7 = require(l_Components_0.Icon);
local v8 = require(l_Components_0.IconButton);
local v9 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v10 = require(l_Components_0.View);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v14 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v17 = require(l_script_FirstAncestor_0.Utility.isCoreGui);
local v18 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v19 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v20 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v21 = {
    width = UDim.new(0, 400)
};
return v3.memo(v3.forwardRef(function(v22, v23) --[[ Line: 70 ]] --[[ Name: TextInput ]]
    -- upvalues: v15 (copy), v21 (copy), v12 (copy), v3 (copy), v20 (copy), v2 (copy), v13 (copy), v14 (copy), v7 (copy), v9 (copy), v10 (copy), v16 (copy), v5 (copy), v18 (copy), v19 (copy), v17 (copy), v8 (copy), v6 (copy)
    local v24 = v15(v22, v21);
    local v25 = v12();
    local v26 = v3.useRef(nil);
    local v27, v28 = v3.useState(false);
    local v29, v30 = v3.useState(false);
    local l_Thick_0 = v25.Stroke.Thick;
    local l_Small_0 = v25.Semantic.Icon.Size.Small;
    local l_Standard_0 = v25.Stroke.Standard;
    local v34 = math.ceil(l_Standard_0) * 2;
    local l_Thick_1 = v25.Stroke.Thick;
    local v36 = math.ceil(l_Thick_1) * 2;
    local v38 = v3.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v24 (copy), l_Small_0 (copy), v25 (copy)
        local v37 = 0;
        if v24.iconLeading then
            v37 = v37 - l_Small_0 - v25.Gap.Large;
        end;
        if v24.iconTrailing then
            v37 = v37 - l_Small_0 - v25.Gap.Large;
        end;
        return v37;
    end, {
        v24.iconLeading, 
        v24.iconTrailing, 
        v25
    });
    local v40 = v3.useCallback(function(v39) --[[ Line: 100 ]]
        -- upvalues: v24 (copy)
        if v39 == nil then
            v24.onChanged("");
            return;
        else
            v24.onChanged(v39.Text);
            return;
        end;
    end, {
        v24.onChanged
    });
    local v41 = v3.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v24 (copy), v30 (copy)
        if not v24.isDisabled then
            v30(true);
            if v24.onFocusGained then
                v24.onFocusGained();
            end;
        end;
    end, {
        v24.onFocusGained, 
        v24.isDisabled
    });
    local v42 = v3.useCallback(function() --[[ Line: 117 ]]
        -- upvalues: v30 (copy)
        v30(false);
    end, {});
    local v43 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v26 (copy)
        if v26.current then
            v26.current:CaptureFocus();
        end;
    end, {});
    local v44 = v3.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v26 (copy)
        if v26.current then
            return (v26.current:IsFocused());
        else
            return false;
        end;
    end, {});
    local v46 = v3.useCallback(function(v45) --[[ Line: 134 ]]
        -- upvalues: v28 (copy), v20 (ref)
        v28(v45 == v20.Hover);
    end, {});
    local v47 = if v2.FoundationStylingPolyfill then nil else v13("gui-object-defaults clip text-align-x-left text-align-y-center text-body-large content-emphasis");
    local v48 = v14({
        radius = UDim.new(0, v25.Radius.Medium), 
        offset = l_Thick_0, 
        borderWidth = l_Thick_0
    });
    local v49 = if v24.iconTrailing then v3.createElement(v7, {
        name = if type(v24.iconTrailing) == "table" then v24.iconTrailing.name else v24.iconTrailing, 
        style = v25.Color.Content.Muted, 
        size = v9.Small, 
        LayoutOrder = 3
    }) else nil;
    v3.useImperativeHandle(v24.textBoxRef, function() --[[ Line: 159 ]]
        -- upvalues: v44 (copy), v43 (copy)
        return {
            getIsFocused = v44, 
            focus = v43
        };
    end, {
        v43, 
        v44
    });
    return v3.createElement(v10, v16(v24, {
        Size = UDim2.new(v24.width, UDim.new(0, 0)), 
        tag = "col gap-xsmall auto-y", 
        ref = v23
    }), {
        InputLabel = if #v24.label > 0 then v3.createElement(v5, {
            Text = v24.label, 
            size = v18.Small, 
            isRequired = v24.isRequired, 
            onActivated = v43, 
            onHover = function(v50) --[[ Line: 181 ]] --[[ Name: onHover ]]
                -- upvalues: v28 (copy)
                v28(v50);
            end, 
            LayoutOrder = 1
        }) else nil, 
        InputCanvas = v3.createElement(v10, {
            LayoutOrder = 2, 
            GroupTransparency = v24.isDisabled and 0.32 or nil, 
            tag = "size-full-1200"
        }, {
            Input = v3.createElement(v10, {
                Size = UDim2.new(1, -v34, 1, -v34), 
                Position = UDim2.new(0, v34 / 2, 0, v34 / 2), 
                selection = {
                    Selectable = not v24.isDisabled, 
                    SelectionImageObject = v48
                }, 
                stroke = {
                    Color = if v24.hasError then v25.Color.System.Alert.Color3 else v25.Color.Stroke.Emphasis.Color3, 
                    Transparency = if v24.hasError then v25.Color.System.Alert.Transparency else v29 and 0 or v25.Color.Stroke.Emphasis.Transparency, 
                    Thickness = l_Standard_0
                }, 
                onActivated = v43, 
                onStateChanged = v46, 
                stateLayer = {
                    affordance = v19.None
                }, 
                tag = "radius-medium bg-shift-100"
            }, {
                BorderFrame = v3.createElement(v10, {
                    Size = UDim2.new(1, -v36, 1, -v36), 
                    Position = UDim2.new(0, v36 / 2, 0, v36 / 2), 
                    cornerRadius = UDim.new(0, v25.Radius.Medium - v36 / 2), 
                    stroke = if not v24.isDisabled and (v27 or v29) then {
                        Color = v25.Color.Stroke.Emphasis.Color3, 
                        Transparency = 0.88, 
                        Thickness = l_Thick_1
                    } else nil, 
                    tag = "row gap-large align-y-center padding-x-medium"
                }, {
                    IconLeading = if v24.iconLeading then v3.createElement(v7, {
                        name = v24.iconLeading, 
                        style = v25.Color.Content.Muted, 
                        size = v9.Small, 
                        LayoutOrder = 1
                    }) else nil, 
                    TextBox = v3.createElement("TextBox", {
                        ref = v26, 
                        Text = v24.text, 
                        ClearTextOnFocus = false, 
                        Size = UDim2.new(1, v38, 1, 0), 
                        TextEditable = not v24.isDisabled, 
                        LineHeight = 1, 
                        PlaceholderText = v24.placeholder, 
                        Selectable = false, 
                        LayoutOrder = 2, 
                        TextInputType = if v17 then v24.textInputType else nil, 
                        BackgroundTransparency = 1, 
                        ClipsDescendants = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v25.Typography.BodyLarge.Font, 
                        TextSize = v25.Typography.BodyLarge.FontSize, 
                        TextColor3 = v25.Color.Content.Emphasis.Color3, 
                        TextTransparency = v25.Color.Content.Emphasis.Transparency, 
                        [v3.Tag] = v47, 
                        [v3.Event.Focused] = v41, 
                        [v3.Event.FocusLost] = v42, 
                        [v3.Change.Text] = v40
                    }), 
                    IconTrailing = if type(v24.iconTrailing) == "table" and v24.iconTrailing.onActivated then v3.createElement(v8, {
                        onActivated = v24.iconTrailing.onActivated, 
                        isDisabled = v24.isDisabled, 
                        size = v9.Small, 
                        icon = v24.iconTrailing.name, 
                        LayoutOrder = 3
                    }) else v49
                })
            })
        }), 
        HintText = if v24.hint then v3.createElement(v6, {
            text = v24.hint, 
            hasError = v24.hasError, 
            LayoutOrder = 3
        }) else nil
    });
end));
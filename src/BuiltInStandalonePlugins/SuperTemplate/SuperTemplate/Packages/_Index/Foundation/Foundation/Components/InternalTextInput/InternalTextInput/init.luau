local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.View);
local _ = require(l_Components_0.Types);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v9 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.useStyledDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.isCoreGui);
local v13 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v14 = require(l_script_FirstAncestor_0.Enums.ControlState);
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 43 ]] --[[ Name: InternalTextInput ]]
    -- upvalues: v7 (copy), v3 (copy), v14 (copy), v2 (copy), v8 (copy), v11 (copy), v9 (copy), v5 (copy), v10 (copy), v13 (copy), v12 (copy)
    local v17 = v7();
    local v18 = v3.useRef(nil);
    local v19, v20 = v3.useState(false);
    local v21, v22 = v3.useState(false);
    local l_Thick_0 = v17.Stroke.Thick;
    local l_Standard_0 = v17.Stroke.Standard;
    local v25 = math.ceil(l_Standard_0) * 2;
    local l_Thick_1 = v17.Stroke.Thick;
    local v27 = math.ceil(l_Thick_1) * 2;
    local v28 = v3.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        if v18.current then
            v18.current:CaptureFocus();
        end;
    end, {});
    local v29 = v3.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy)
        if v18.current then
            return (v18.current:IsFocused());
        else
            return nil;
        end;
    end, {});
    v3.useImperativeHandle(v16, function() --[[ Line: 70 ]]
        -- upvalues: v29 (copy), v28 (copy), v20 (copy)
        return {
            getIsFocused = v29, 
            focus = v28, 
            setHover = v20
        };
    end, {
        v29, 
        v28
    });
    local v31 = v3.useCallback(function(v30) --[[ Line: 78 ]]
        -- upvalues: v15 (copy)
        if v30 == nil then
            v15.onChanged("");
            return;
        else
            v15.onChanged(v30.Text);
            return;
        end;
    end, {
        v15.onChanged
    });
    local v32 = v3.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v15 (copy), v22 (copy)
        if v15.isDisabled then
            return;
        else
            v22(true);
            if v15.onFocus then
                v15.onFocus();
            end;
            return;
        end;
    end, {
        v15.onFocus, 
        v15.isDisabled
    });
    local v33 = v3.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v22 (copy), v15 (copy)
        v22(false);
        if v15.onFocusLost then
            v15.onFocusLost();
        end;
    end, {
        v15.onFocusLost
    });
    local v35 = v3.useCallback(function(v34) --[[ Line: 104 ]]
        -- upvalues: v20 (copy), v14 (ref)
        v20(v34 == v14.Hover);
    end, {});
    local v36 = if v2.FoundationStylingPolyfill then nil else v8((("gui-object-defaults size-full fill clip text-align-x-left text-align-y-center text-body-large content-emphasis %*"):format(v15.tag)));
    local v37 = nil;
    if v2.FoundationStylingPolyfill then
        v37 = {
            UIFlexItem = v3.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        };
        local v38 = v11("TextBox", v15.tag, nil, {});
        if v38.padding then
            v37.UIPadding = v3.createElement("UIPadding", {
                PaddingLeft = v38.padding.left, 
                PaddingRight = v38.padding.right, 
                PaddingTop = v38.padding.top, 
                PaddingBottom = v38.padding.bottom
            });
        end;
    end;
    local v39 = v9({
        radius = UDim.new(0, v17.Radius.Medium), 
        offset = l_Thick_0, 
        borderWidth = l_Thick_0
    });
    return v3.createElement(v5, v10(v15, {
        GroupTransparency = v15.isDisabled and 0.32 or nil, 
        tag = "size-full-1200"
    }), {
        Input = v3.createElement(v5, {
            Size = UDim2.new(1, -v25, 1, -v25), 
            Position = UDim2.new(0, v25 / 2, 0, v25 / 2), 
            selection = {
                Selectable = not v15.isDisabled, 
                SelectionImageObject = v39
            }, 
            stroke = {
                Color = if v15.hasError then v17.Color.System.Alert.Color3 else v17.Color.Stroke.Emphasis.Color3, 
                Transparency = if v15.hasError then v17.Color.System.Alert.Transparency else v21 and 0 or v17.Color.Stroke.Emphasis.Transparency, 
                Thickness = l_Standard_0
            }, 
            onActivated = v28, 
            onStateChanged = v35, 
            stateLayer = {
                affordance = v13.None
            }, 
            tag = "radius-medium bg-shift-100"
        }, {
            BorderFrame = v3.createElement(v5, {
                Size = UDim2.new(1, -v27, 1, -v27), 
                Position = UDim2.new(0, v27 / 2, 0, v27 / 2), 
                cornerRadius = UDim.new(0, v17.Radius.Medium - v27 / 2), 
                stroke = if not v15.isDisabled and (v19 or v21) then {
                    Color = v17.Color.Stroke.Emphasis.Color3, 
                    Transparency = 0.88, 
                    Thickness = l_Thick_1
                } else nil, 
                tag = "row align-y-center"
            }, {
                Leading = if v15.leadingElement then v3.createElement(v5, {
                    LayoutOrder = 1, 
                    tag = "size-0-full auto-x"
                }, v15.leadingElement) else nil, 
                TextBox = v3.createElement("TextBox", {
                    ref = v18, 
                    Text = v15.text, 
                    TextInputType = if v12 then v15.textInputType else nil, 
                    ClearTextOnFocus = false, 
                    TextEditable = not v15.isDisabled, 
                    PlaceholderText = v15.placeholder, 
                    Selectable = false, 
                    LayoutOrder = 2, 
                    LineHeight = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v17.Typography.BodyLarge.Font, 
                    TextSize = v17.Typography.BodyLarge.FontSize, 
                    TextColor3 = v17.Color.Content.Emphasis.Color3, 
                    TextTransparency = v17.Color.Content.Emphasis.Transparency, 
                    [v3.Tag] = v36, 
                    [v3.Event.Focused] = v32, 
                    [v3.Event.FocusLost] = v33, 
                    [v3.Change.Text] = v31
                }, v37), 
                Trailing = if v15.trailingElement then v3.createElement(v5, {
                    LayoutOrder = 3, 
                    tag = "size-0-full auto-x"
                }, v15.trailingElement) else nil
            })
        })
    });
end));
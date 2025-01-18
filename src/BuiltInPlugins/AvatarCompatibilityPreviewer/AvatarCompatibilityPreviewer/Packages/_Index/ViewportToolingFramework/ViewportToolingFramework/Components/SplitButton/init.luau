local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v2 = require(l_script_FirstAncestor_0.Components.Icon);
local v3 = require(l_script_FirstAncestor_0.Parent.Framework);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v6 = require(l_script_FirstAncestor_0.Util.ToolbarBaseContext);
local v7 = require(l_script_FirstAncestor_0.Components.Tooltip);
local _ = require(l_script_FirstAncestor_0.Types);
local v9 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
local v10 = require(l_script_FirstAncestor_0.Hooks.useToggleState);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
local l_Focus_0 = v3.ContextServices.Focus;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local function _(v14, v15) --[[ Line: 29 ]] --[[ Name: positionInObject ]]
    local v16 = false;
    if v14.X >= v15.AbsolutePosition.X then
        v16 = false;
        if v14.X <= v15.AbsolutePosition.X + v15.AbsoluteSize.X then
            v16 = false;
            if v14.Y >= v15.AbsolutePosition.Y then
                v16 = v14.Y <= v15.AbsolutePosition.Y + v15.AbsoluteSize.Y;
            end;
        end;
    end;
    return v16;
end;
local function v60(v18) --[[ Line: 38 ]] --[[ Name: FlyoutMenu ]]
    -- upvalues: l_Focus_0 (copy), v4 (copy), v6 (copy), v9 (copy), l_LayoutOrderIterator_0 (copy), l_UserInputService_0 (copy), v2 (copy), v5 (copy)
    local v19 = l_Focus_0:use():get();
    local v20 = v4.useContext(v6);
    local v21 = v9();
    local v22, v23 = v4.useState(nil);
    local v26 = v4.useCallback(function(v24) --[[ Line: 51 ]]
        -- upvalues: v20 (copy), v23 (copy), v19 (copy)
        if v20.Direction == "Horizontal" then
            v23(v24.AbsolutePosition + Vector2.new(0, v24.AbsoluteSize.Y + 10) - v19.AbsolutePosition);
            return;
        elseif v20.Direction == "Vertical" then
            v23(v24.AbsolutePosition + Vector2.new(v24.AbsoluteSize.X + 10, 0) - v19.AbsolutePosition);
            return;
        else
            local _ = v20.Direction;
            return;
        end;
    end, {
        v19, 
        v20.Direction
    });
    local v27 = l_LayoutOrderIterator_0.new();
    local v28 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: l_UserInputService_0 (ref), v28 (copy), v18 (copy)
        local v33 = l_UserInputService_0.InputBegan:Connect(function(v29) --[[ Line: 71 ]]
            -- upvalues: v28 (ref), v18 (ref)
            if v29.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            else
                local l_current_0 = v28.current;
                if l_current_0 == nil then
                    return;
                else
                    assert(l_current_0 ~= nil, "Luau");
                    local l_Position_0 = v29.Position;
                    local v32 = false;
                    if l_Position_0.X >= l_current_0.AbsolutePosition.X then
                        v32 = false;
                        if l_Position_0.X <= l_current_0.AbsolutePosition.X + l_current_0.AbsoluteSize.X then
                            v32 = false;
                            if l_Position_0.Y >= l_current_0.AbsolutePosition.Y then
                                v32 = l_Position_0.Y <= l_current_0.AbsolutePosition.Y + l_current_0.AbsoluteSize.Y;
                            end;
                        end;
                    end;
                    if v32 then
                        return;
                    else
                        v18.Close();
                        return;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 89 ]]
            -- upvalues: v33 (copy)
            v33:Disconnect();
        end;
    end, {
        v18.Close
    });
    local v34 = {};
    local v35 = v4.useRef({});
    assert(v35.current ~= nil, "Luau");
    for v36, v37 in v18.Options do
        v34[("Option%*"):format(v36)] = v4.createElement("Frame", {
            LayoutOrder = v36, 
            ref = function(v38) --[[ Line: 103 ]] --[[ Name: ref ]]
                -- upvalues: v35 (copy), v36 (copy)
                v35.current[v36] = v38;
                return function() --[[ Line: 106 ]]
                    -- upvalues: v35 (ref), v36 (ref)
                    v35.current[v36] = nil;
                end;
            end, 
            [v4.Tag] = "X-Pad X-RowS X-Middle X-Fit X-Corner"
        }, {
            Icon = v4.createElement("Frame", {
                LayoutOrder = v27:getNextOrder(), 
                Size = UDim2.fromOffset(24, 24), 
                [v4.Tag] = "VPF-X-Square"
            }, {
                Icon = v4.createElement(v2, {
                    Icon = v37.Icon
                })
            }), 
            Label = v4.createElement("TextLabel", {
                Font = Enum.Font.BuilderSans, 
                LayoutOrder = v27:getNextOrder(), 
                Text = v37.Text, 
                [v4.Tag] = "X-Fit"
            })
        });
    end;
    local v39, v40 = v4.useState(nil);
    local function v45(v41) --[[ Line: 136 ]] --[[ Name: getOptionIndexAtPosition ]]
        -- upvalues: v35 (copy)
        for v42, v43 in v35.current do
            assert(v43 ~= nil, "Luau");
            local v44 = false;
            if v41.X >= v43.AbsolutePosition.X then
                v44 = false;
                if v41.X <= v43.AbsolutePosition.X + v43.AbsoluteSize.X then
                    v44 = false;
                    if v41.Y >= v43.AbsolutePosition.Y then
                        v44 = v41.Y <= v43.AbsolutePosition.Y + v43.AbsoluteSize.Y;
                    end;
                end;
            end;
            if v44 then
                return v42;
            end;
        end;
        return nil;
    end;
    v4.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: l_UserInputService_0 (ref), v40 (copy), v45 (copy)
        local v47 = l_UserInputService_0.InputChanged:Connect(function(v46) --[[ Line: 151 ]]
            -- upvalues: v40 (ref), v45 (ref)
            if v46.UserInputType ~= Enum.UserInputType.MouseMovement then
                return;
            else
                v40((v45(v46.Position)));
                return;
            end;
        end);
        return function() --[[ Line: 159 ]]
            -- upvalues: v47 (copy)
            v47:Disconnect();
        end;
    end, {});
    local v48 = v4.useRef(v18.OnClickOption);
    v48.current = v18.OnClickOption;
    assert(v48.current ~= nil, "Luau");
    v4.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: l_UserInputService_0 (ref), v45 (copy), v48 (copy), v18 (copy)
        local v49 = nil;
        local v50 = false;
        local v52 = l_UserInputService_0.InputBegan:Connect(function(v51) --[[ Line: 174 ]]
            -- upvalues: v49 (ref), v45 (ref)
            if v51.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            else
                v49 = v45(v51.Position);
                return;
            end;
        end);
        local v54 = l_UserInputService_0.InputChanged:Connect(function(v53) --[[ Line: 182 ]]
            -- upvalues: v49 (ref), v45 (ref), v50 (ref)
            if v53.UserInputType ~= Enum.UserInputType.MouseMovement then
                return;
            elseif v49 == nil then
                return;
            else
                if v45(v53.Position) ~= v49 then
                    v50 = true;
                end;
                return;
            end;
        end);
        local v56 = l_UserInputService_0.InputEnded:Connect(function(v55) --[[ Line: 197 ]]
            -- upvalues: v49 (ref), v50 (ref), v48 (ref), v18 (ref)
            if v55.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            elseif v49 == nil then
                return;
            else
                assert(v49 ~= nil, "Luau");
                if v50 then
                    v50 = false;
                    return;
                else
                    v48.current(v49);
                    v18.Close();
                    return;
                end;
            end;
        end);
        return function() --[[ Line: 216 ]]
            -- upvalues: v52 (copy), v54 (copy), v56 (copy)
            v52:Disconnect();
            v54:Disconnect();
            v56:Disconnect();
        end;
    end, {});
    local v57 = v39 and v35.current[v39];
    local v58 = l_LayoutOrderIterator_0.new();
    local v59 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 228 ]]
        -- upvalues: v59 (copy), v26 (copy)
        assert(v59.current ~= nil, "Reference must have been mounted");
        v26(v59.current);
    end, {});
    return v4.createElement(v4.Fragment, {}, {
        Reference = v4.createElement("Frame", {
            [v4.Change.AbsolutePosition] = v26, 
            [v4.Change.AbsoluteSize] = v26, 
            [v4.Tag] = "X-Fill", 
            ref = v59
        }), 
        FlyoutMenu = v22 and v5.createPortal(v4.createElement("Folder", {}, {
            StyleLink = v4.createElement("StyleLink", {
                StyleSheet = v21
            }), 
            Contents = v4.createElement("TextButton", {
                BackgroundTransparency = 0, 
                Position = UDim2.fromOffset(v22.X, v22.Y), 
                ZIndex = v58:getNextOrder(), 
                [v4.Tag] = "X-Fit X-Stroke X-Corner VPF-X-MainBg", 
                ref = v28
            }, {
                HoverBackground = v57 and v28.current and v4.createElement("Frame", {
                    Position = UDim2.fromOffset(0, v57.AbsolutePosition.Y - v28.current.AbsolutePosition.Y), 
                    Size = UDim2.new(1, 0, 0, v57.AbsoluteSize.Y), 
                    ZIndex = v58:getNextOrder(), 
                    [v4.Tag] = "X-Corner VPF-X-ContrastBg"
                }), 
                Options = v4.createElement("Frame", {
                    ZIndex = v58:getNextOrder(), 
                    [v4.Tag] = "X-Fit X-Column"
                }, v34)
            })
        }), v19)
    });
end;
return function(v61) --[[ Line: 283 ]] --[[ Name: SplitButton ]]
    -- upvalues: v11 (copy), v4 (copy), v10 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v7 (copy), v60 (copy), v2 (copy)
    assert(v11(), "FFlagViewportToolingFrameworkSplitButtons not enabled");
    local v62 = v4.useMemo(v61.NextOrder, {
        v61.NextOrder
    });
    local v63, v64 = v4.useState(1);
    local v65 = v61.Item.Options[v63];
    if v65 == nil then
        error((("Couldn't find option at index %*. Are you dynamically changing the options?"):format(v63)));
    end;
    local v66 = v4.useRef(v65);
    v66.current = v65;
    assert(v66.current ~= nil, "Luau");
    local v67 = v10();
    local v75 = v4.useCallback(function(v68, v69) --[[ Line: 305 ]]
        -- upvalues: v67 (copy), v66 (copy)
        if v69.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return;
        elseif v68.AbsolutePosition.X + v68.AbsoluteSize.X - v69.Position.X <= 11 then
            v67.toggle();
            return;
        else
            local v70 = not v67.enabled;
            v67.disable();
            local v71 = task.delay(0.4, function() --[[ Line: 322 ]]
                -- upvalues: v70 (ref), v67 (ref)
                v70 = false;
                v67.enable();
            end);
            v69:GetPropertyChangedSignal("UserInputState"):Once(function() --[[ Line: 327 ]]
                -- upvalues: v69 (copy), v68 (copy), v71 (copy), v70 (ref), v66 (ref)
                local l_Position_1 = v69.Position;
                local l_v68_0 = v68;
                local v74 = false;
                if l_Position_1.X >= l_v68_0.AbsolutePosition.X then
                    v74 = false;
                    if l_Position_1.X <= l_v68_0.AbsolutePosition.X + l_v68_0.AbsoluteSize.X then
                        v74 = false;
                        if l_Position_1.Y >= l_v68_0.AbsolutePosition.Y then
                            v74 = l_Position_1.Y <= l_v68_0.AbsolutePosition.Y + l_v68_0.AbsoluteSize.Y;
                        end;
                    end;
                end;
                task.cancel(v71);
                if v74 and v70 then
                    v66.current.OnClick();
                end;
            end);
            return;
        end;
    end, {
        v67.enabled
    });
    local v76 = l_LayoutOrderIterator_0.new();
    return v4.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.X, 
        LayoutOrder = v62, 
        [v4.Event.InputBegan] = v75, 
        [v4.Tag] = v3.Styling.joinTags("VPF-Button", v67.enabled and "VPF-Button--Selected" or "VPF-Button--Unselected")
    }, {
        Tooltip = not v67.enabled and v4.createElement(v7, {
            Title = v65.Text, 
            Description = v65.TooltipDescription
        }), 
        FlyoutMenu = v67.enabled and v4.createElement(v60, {
            Options = v61.Item.Options, 
            OnClickOption = function(v77) --[[ Line: 358 ]] --[[ Name: OnClickOption ]]
                -- upvalues: v64 (copy), v61 (copy)
                v64(v77);
                local v78 = v61.Item.Options[v77];
                if v78.OnSelect ~= nil then
                    v78.OnSelect();
                end;
            end, 
            Close = v67.disable
        }), 
        Inner = v4.createElement("Frame", {
            [v4.Tag] = "X-Fill X-PadS X-Row"
        }, {
            Icon = v4.createElement(v2, {
                LayoutOrder = v76:getNextOrder(), 
                Icon = v65.Icon
            }), 
            Arrow = v4.createElement("Frame", {
                LayoutOrder = v76:getNextOrder(), 
                Size = UDim2.new(0, 6, 1, 0)
            }, {
                ArrowImage = v4.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Image = "rbxasset://studio_svg_textures/Lua/ViewportToolingFramework/Light/Standard/flyoutArrow.png", 
                    Position = UDim2.fromScale(0.5, 1), 
                    Size = UDim2.fromOffset(4, 4), 
                    [v4.Tag] = "VPF-X-Primary"
                })
            })
        })
    });
end;
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.Components.DEPRECATED_AvoidFOUC);
local v6 = require(l_script_FirstAncestor_0.Util.ToolbarBaseContext);
local v7 = require(l_script_FirstAncestor_0.Hooks.useStyleSheet);
local v8 = require(l_script_FirstAncestor_0.Hooks.useToggleState);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Focus_0 = v2.ContextServices.Focus;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
local l_SourceSans_0 = Enum.Font.SourceSans;
return function(v13) --[[ Line: 33 ]] --[[ Name: Tooltip ]]
    -- upvalues: v3 (copy), v6 (copy), v7 (copy), l_Focus_0 (copy), v8 (copy), l_LayoutOrderIterator_0 (copy), l_TextService_0 (copy), l_SourceSans_0 (copy), v4 (copy), v11 (copy), v5 (copy)
    local v14 = v3.useContext(v6);
    local v15 = v7();
    local v16 = l_Focus_0:use();
    assert(v16 ~= nil, "Tooltip mounting without a Focus");
    local v17, v18 = v3.useState(Vector2.new());
    local v19, v20 = v3.useState(Vector2.new());
    local v21 = v8(false);
    local v22 = l_LayoutOrderIterator_0.new();
    local v23 = if v13.Description then l_TextService_0:GetTextSize(v13.Description, 14, l_SourceSans_0, Vector2.new(180, 1e999)) else Vector2.new();
    return v3.createElement("Frame", {
        [v3.Tag] = "X-Fill", 
        [v3.Change.AbsolutePosition] = function(v24) --[[ Line: 60 ]]
            -- upvalues: v18 (copy)
            v18(v24.AbsolutePosition);
        end, 
        [v3.Change.AbsoluteSize] = function(v25) --[[ Line: 64 ]]
            -- upvalues: v20 (copy)
            v20(v25.AbsoluteSize);
        end, 
        [v3.Event.MouseEnter] = v21.enable, 
        [v3.Event.MouseLeave] = v21.disable
    }, {
        VisibleTooltip = v21.enabled and v4.createPortal(v3.createElement("Folder", {}, {
            AvoidFOUC = if v11() then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(v17.X, v17.Y), 
                Size = UDim2.fromOffset(v19.X, v19.Y), 
                ZIndex = 100
            }, {
                Tooltip = v3.createElement("Frame", {
                    [v3.Tag] = ("VPF-Tooltip VPF-Tooltip--%* X-ColumnS"):format(v14.Direction)
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 5), 
                        PaddingRight = UDim.new(0, 5), 
                        PaddingTop = UDim.new(0, 5), 
                        PaddingBottom = UDim.new(0, 5)
                    }), 
                    UISizeConstraint = v3.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(180, 1e999)
                    }), 
                    Title = v3.createElement("TextLabel", {
                        LayoutOrder = v22:getNextOrder(), 
                        Text = v13.Title, 
                        [v3.Tag] = "VPF-Tooltip__Title"
                    }), 
                    Description = v13.Description and v3.createElement("TextLabel", {
                        LayoutOrder = v22:getNextOrder(), 
                        Font = l_SourceSans_0, 
                        Size = UDim2.fromOffset(v23.X + 5, v23.Y + 5), 
                        Text = v13.Description, 
                        TextSize = 14, 
                        [v3.Tag] = "VPF-Tooltip__Description"
                    })
                })
            }) else v3.createElement(v5, {}, {
                VisibleTooltip = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromOffset(v17.X, v17.Y), 
                    Size = UDim2.fromOffset(v19.X, v19.Y), 
                    ZIndex = 100
                }, {
                    Tooltip = v3.createElement("Frame", {
                        [v3.Tag] = ("VPF-Tooltip VPF-Tooltip--%* X-ColumnS"):format(v14.Direction)
                    }, {
                        UIPadding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 5), 
                            PaddingRight = UDim.new(0, 5), 
                            PaddingTop = UDim.new(0, 5), 
                            PaddingBottom = UDim.new(0, 5)
                        }), 
                        UISizeConstraint = v3.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(180, 1e999)
                        }), 
                        Title = v3.createElement("TextLabel", {
                            LayoutOrder = v22:getNextOrder(), 
                            Text = v13.Title, 
                            [v3.Tag] = "VPF-Tooltip__Title"
                        }), 
                        Description = v13.Description and v3.createElement("TextLabel", {
                            LayoutOrder = v22:getNextOrder(), 
                            Font = l_SourceSans_0, 
                            Size = UDim2.fromOffset(v23.X + 5, v23.Y + 5), 
                            Text = v13.Description, 
                            TextSize = 14, 
                            [v3.Tag] = "VPF-Tooltip__Description"
                        })
                    })
                })
            }), 
            StyleLink = v3.createElement("StyleLink", {
                StyleSheet = v15
            })
        }), v16:get())
    });
end;
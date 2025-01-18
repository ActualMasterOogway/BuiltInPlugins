local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function() --[[ Line: 8 ]] --[[ Name: SimpleSelectScreen ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.ContextServices.Localization:use();
    local v5 = v2.ContextServices.Stylizer:use("SimpleSelectScreen");
    local v6 = v2.Util.LayoutOrderIterator.new();
    local v7 = v2.ContextServices.Plugin:use():get();
    local v10 = v1.useCallback(function() --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v7 (copy)
        local v8 = v2.Util.StudioUri.fromAction("MeshImporter", "Toggle");
        local l_v7_PluginComponent_0 = v7:GetPluginComponent("Actions");
        task.spawn(function() --[[ Line: 18 ]]
            -- upvalues: l_v7_PluginComponent_0 (copy), v8 (copy)
            l_v7_PluginComponent_0:ActivateAsync(v8);
        end);
    end, {
        v7
    });
    return v1.createElement(v2.UI.Pane, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        BackgroundColor3 = v5.BackgroundColor
    }, {
        Buttons = v1.createElement(v2.UI.Pane, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = 20, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = v6:getNextOrder()
        }, {
            Frame = v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = v5.ImageBackgroundColor, 
                BorderSizePixel = 0
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                Image = v1.createElement(v2.UI.Image, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v6:getNextOrder(), 
                    Image = "rbxassetid://6022668945", 
                    ImageColor3 = v5.IconColor, 
                    Size = v5.ImageSize
                })
            }), 
            SelectHint = v1.createElement(v2.UI.TextLabel, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v6:getNextOrder(), 
                TextWrapped = true, 
                FontFace = v5.FontFace, 
                Text = v4:getText("SelectScreen", "SelectHint")
            }), 
            SplitLabel = v1.createElement(v2.UI.Pane, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Spacing = v5.Spacing, 
                LayoutOrder = v6:getNextOrder(), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                LeftLabel = v1.createElement("Frame", {
                    LayoutOrder = v6:getNextOrder(), 
                    BackgroundColor3 = v5.LineColor, 
                    BorderSizePixel = 0, 
                    Size = v5.LineSize
                }), 
                OrLabel = v1.createElement(v2.UI.TextLabel, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v6:getNextOrder(), 
                    Text = v4:getText("SelectScreen", "Or")
                }), 
                RightLabel = v1.createElement("Frame", {
                    LayoutOrder = v6:getNextOrder(), 
                    BackgroundColor3 = v5.LineColor, 
                    BorderSizePixel = 0, 
                    Size = v5.LineSize
                })
            }), 
            Import3D = v1.createElement(v2.UI.IconButton, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v6:getNextOrder(), 
                Cursor = "PointingHand", 
                OnClick = v10, 
                Size = UDim2.fromOffset(0, v5.ButtonHeight), 
                Padding = 5, 
                Spacing = 5, 
                Text = v4:getText("SelectScreen", "Import3DFile"), 
                Style = "PrimaryBrand"
            })
        })
    });
end;
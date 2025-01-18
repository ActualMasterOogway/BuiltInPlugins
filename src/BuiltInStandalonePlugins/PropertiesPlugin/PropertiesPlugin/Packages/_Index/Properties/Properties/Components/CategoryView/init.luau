local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Components.PropertyView);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Util.categorizeProperties);
local v6 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v8 = {
    standard = function(v7) --[[ Line: 12 ]] --[[ Name: standard ]]
        return (("rbxasset://studio_svg_textures/Lua/Explorer/Light/Standard/%*.png"):format(v7));
    end
};
local v9 = v8.standard("expanded");
local v10 = v8.standard("collapsed");
return function(v11) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), v3 (copy), v1 (copy), v9 (copy), v10 (copy), v2 (copy)
    local v12 = {};
    local v13 = v6();
    local v14, v15 = v3.useState(true);
    v12.SectionHeader = v3.createElement(v1.UI.Pane, {
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        OnClick = function(_, _, v18) --[[ Line: 38 ]] --[[ Name: OnClick ]]
            -- upvalues: v15 (copy), v14 (copy)
            if v18 % 2 == 1 then
                v15(not v14);
            end;
        end
    }, {
        ClickableExpandArea = v3.createElement(v1.UI.Pane, {
            LayoutOrder = v13(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            OnClick = function() --[[ Line: 48 ]] --[[ Name: OnClick ]]

            end, 
            [v3.Event.MouseButton1Down] = function() --[[ Line: 49 ]]
                -- upvalues: v15 (copy), v14 (copy)
                v15(not v14);
            end
        }, {
            ExpandImage = v3.createElement(v1.UI.Image, {
                Image = if v14 then v9 else v10, 
                Size = UDim2.fromOffset(20, 20)
            })
        }), 
        Label = v3.createElement("TextLabel", {
            LayoutOrder = v13(), 
            Text = v11.category.categoryName, 
            [v3.Tag] = "Text-Emphasis-Bold", 
            AutomaticSize = Enum.AutomaticSize.XY
        })
    });
    if v14 then
        for v19, v20 in v11.category.propertiesInOrder do
            v12[v19] = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                LayoutOrder = v19
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 2)
                }), 
                Property = v3.createElement("TextLabel", {
                    [v3.Tag] = "Text-Default", 
                    Text = v20.id.propertyName, 
                    ClipsDescendants = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(0.4, -5, 0, 0)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 1)
                    })
                }), 
                Value = v3.createElement(v2, {
                    layoutOrder = 0, 
                    record = v20, 
                    session = v11.session, 
                    position = UDim2.fromScale(0.4, 0), 
                    size = UDim2.fromScale(0.6, 0)
                })
            });
        end;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        [v3.Tag] = "X-ColumnS", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0)
    }, v12);
end;
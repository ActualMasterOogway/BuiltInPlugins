local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.CategoryView);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.categorizeProperties);
local l_createElement_0 = v3.createElement;
return function(v7) --[[ Line: 11 ]] --[[ Name: SessionView ]]
    -- upvalues: v2 (copy), v5 (copy), l_createElement_0 (copy), v1 (copy), v3 (copy)
    local v8 = v2.use(v7.session.propertiesObservable);
    local v9 = v5(v8);
    local v10 = {};
    for v11, v12 in v9 do
        v10[v12.categoryName] = l_createElement_0(v1, {
            session = v7.session, 
            category = v12, 
            layoutOrder = v11
        });
    end;
    return l_createElement_0("Frame", {
        [v3.Tag] = "X-Fill X-Column BG-Surface100"
    }, {
        Count = l_createElement_0("TextLabel", {
            [v3.Tag] = "Text-Emphasis", 
            Text = ("Total properties: %*"):format(#v8), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0
        }), 
        ScrollingContent = l_createElement_0("ScrollingFrame", {
            BorderSizePixel = 0, 
            ScrollBarThickness = 8, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            CanvasSize = UDim2.fromScale(1, 0)
        }, {
            Flex = l_createElement_0("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Grow
            }), 
            PropertyRows = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                [v3.Tag] = "X-ColumnS", 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, v10)
        })
    });
end;
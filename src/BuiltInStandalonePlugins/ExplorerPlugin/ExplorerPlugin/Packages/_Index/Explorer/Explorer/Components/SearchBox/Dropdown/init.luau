local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.SearchBox.DropdownItem);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v4 = require(l_script_FirstAncestor_0.Util.mapValues);
local l_createElement_0 = v2.createElement;
return function(v6) --[[ Line: 28 ]] --[[ Name: Dropdown ]]
    -- upvalues: v2 (copy), v3 (copy), l_createElement_0 (copy), v4 (copy), v1 (copy)
    local v7, v8 = v2.useState(0);
    local v9 = if v6.shouldIgnoreMaxHeight then v7 else math.min(v7, 130);
    local v10 = v9 < v7;
    local v11 = UDim2.new(1, v10 and -8 or 0, 0, 22);
    local v16 = v2.useCallback(function(v12) --[[ Line: 44 ]]
        -- upvalues: v8 (copy)
        local v13 = 0;
        for _, v15 in v12:GetChildren() do
            if v15:IsA("GuiObject") then
                v13 = v13 + v15.AbsoluteSize.Y + 5;
            end;
        end;
        v8(v13 - 5);
    end, {});
    local v17 = v3();
    return l_createElement_0("Frame", {
        ref = v6.dropdownRef, 
        [v2.Tag] = "X-Column X-Pad Explorer-BG-Surface100 Explorer-SearchBox-Corner Explorer-SearchBox-Dropdown"
    }, {
        Header = v6.headerInfo and l_createElement_0("Frame", {
            LayoutOrder = v17(), 
            ZIndex = 2, 
            [v2.Tag] = "X-RowS X-Top Explorer-SearchBox-DropdownHeader"
        }, {
            Title = l_createElement_0("TextLabel", {
                LayoutOrder = v17(), 
                Text = v6.headerInfo.titleText, 
                [v2.Tag] = "Explorer-FillX Explorer-SearchBox-DropdownTitle"
            }), 
            Button = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v17(), 
                [v2.Tag] = "X-Fit"
            }, {
                v6.headerInfo.button
            })
        }), 
        ScrollingFrame = l_createElement_0("ScrollingFrame", {
            LayoutOrder = v17(), 
            ScrollBarThickness = v10 and 8 or 0, 
            Size = UDim2.new(1, 0, 0, v9), 
            ZIndex = 1, 
            [v2.Change.AbsoluteSize] = v16, 
            [v2.Tag] = "X-ColumnS Explorer-SidePadS"
        }, v4(v6.itemData, function(v18, v19) --[[ Line: 92 ]]
            -- upvalues: l_createElement_0 (ref), v1 (ref), v11 (copy), v6 (copy)
            return (l_createElement_0(v1, {
                displayText = v18.displayText, 
                icon = v18.icon, 
                index = v19, 
                keepIconColor = v18.keepIconColor, 
                minSize = v11, 
                onClick = v6.onItemClicked, 
                text = v18.text
            }));
        end))
    });
end;
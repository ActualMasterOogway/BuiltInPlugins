local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local l_createElement_0 = v2.createElement;
local l_joinTags_0 = v1.Styling.joinTags;
return function(v7) --[[ Line: 11 ]] --[[ Name: DropdownItem ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_createElement_0 (copy), l_joinTags_0 (copy)
    local v8 = v3.useToggleState();
    local v9 = v2.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v7 (copy)
        v7.onClick(v7.text);
    end, {
        v7.onClick, 
        v7.text
    });
    local v10 = v4();
    return l_createElement_0("TextButton", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = v8.enabled and 0.92 or 1, 
        LayoutOrder = v7.index, 
        Size = UDim2.new(v7.minSize.X.Scale, v7.minSize.X.Offset, 0, 0), 
        ZIndex = 2, 
        [v2.Event.MouseButton1Down] = v9, 
        [v2.Event.MouseEnter] = v8.enable, 
        [v2.Event.MouseLeave] = v8.disable, 
        [v2.Tag] = ("X-Top X-RowS Explorer-SidePadS Explorer-SearchBox-Corner Explorer-SearchBox-DropdownItem data-testid=DropdownItem-%*"):format(v7.index)
    }, {
        Icon = v7.icon and l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v10(), 
            [v2.Tag] = "X-Fit"
        }, {
            Image = l_createElement_0("ImageLabel", {
                Image = v7.icon, 
                [v2.Tag] = l_joinTags_0(not v7.keepIconColor and "Explorer-Content-Standard", "Explorer-Icon")
            }), 
            SmallAestheticPadding = l_createElement_0("UIPadding", {
                PaddingTop = UDim.new(0, 3)
            })
        }), 
        Text = l_createElement_0("TextLabel", {
            LayoutOrder = v10(), 
            Size = UDim2.fromScale(1, 0), 
            Text = v7.displayText or v7.text, 
            TextWrapped = true, 
            [v2.Tag] = "X-FitY Explorer-FillX Explorer-StandardText"
        }, {
            MinHeight = l_createElement_0("UISizeConstraint", {
                MinSize = Vector2.new(0, v7.minSize.Y.Offset)
            })
        })
    });
end;
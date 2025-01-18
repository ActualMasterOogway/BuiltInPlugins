local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useCursor);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 27 ]] --[[ Name: PillTabs ]]
    -- upvalues: l_useState_0 (copy), v3 (copy), v1 (copy)
    local v6, v7 = l_useState_0(v5.Tabs[1].Key);
    local v8, v9 = v3("PointingHand");
    local v10 = {};
    for v11, v12 in v5.Tabs do
        table.insert(v10, (v1.createElement("ImageButton", {
            LayoutOrder = v11, 
            [v1.Event.Activated] = function() --[[ Line: 36 ]]
                -- upvalues: v7 (copy), v12 (copy), v5 (copy), v11 (copy)
                v7(v12.Key);
                v5.OnTabSelected(v11);
            end, 
            [v1.Event.MouseEnter] = v8, 
            [v1.Event.MouseLeave] = v9, 
            [v1.Tag] = "X-Fit StartPage-RoundedCorner8" .. (v12.Key == v6 and " StartPage-Selected" or " StartPage-PageBackground")
        }, {
            v1.createElement("TextLabel", {
                Text = v12.Label or v12.Title, 
                [v1.Tag] = "X-Fit X-Transparent StartPage-FontBold StartPage-PillPadding StartPage-TextSize StartPage-TextColor"
            })
        })));
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 100, 0, 32), 
        [v1.Tag] = "X-Fit X-RowM X-Transparent"
    }, v10);
end;
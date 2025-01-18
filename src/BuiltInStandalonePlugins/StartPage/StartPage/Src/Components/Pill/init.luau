local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 17 ]] --[[ Name: Pill ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        Position = v2.Position, 
        LayoutOrder = v2.LayoutOrder, 
        [v1.Tag] = "X-Row X-Fit X-Middle X-Center StartPage-Selected StartPage-Circular StartPage-Selected StartPage-PillPaddingS"
    }, {
        v1.createElement("TextLabel", {
            Text = v2.Text, 
            TextSize = 12, 
            [v1.Tag] = "X-Fit StartPage-TextColor StartPage-FontBold X-Transparent"
        })
    });
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
return v1.memo(function(v2) --[[ Line: 12 ]] --[[ Name: NotificationText ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        Size = v2.Size, 
        LayoutOrder = v2.LayoutOrder, 
        [v1.Tag] = "Component-NotificationText X-Column"
    }, {
        Subject = v1.createElement("TextLabel", {
            Text = v2.Subject, 
            LayoutOrder = 1
        }), 
        Subline = if v2.Subline ~= nil and v2.Subline ~= "" then v1.createElement("TextLabel", {
            Text = v2.Subline, 
            LayoutOrder = 2
        }) else nil, 
        ElapsedTime = v1.createElement("TextLabel", {
            Text = v2.ElapsedTime, 
            LayoutOrder = 3
        })
    });
end);
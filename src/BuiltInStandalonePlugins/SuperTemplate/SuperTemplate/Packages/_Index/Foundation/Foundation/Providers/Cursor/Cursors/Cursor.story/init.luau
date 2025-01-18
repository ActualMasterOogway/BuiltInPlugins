local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.Cursor);
local v4 = require(l_script_FirstAncestor_0.Enums.CursorType);
local function v6(v5) --[[ Line: 9 ]] --[[ Name: getStory ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 50)
    }, {
        Frame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -20, 1, -20), 
            Position = UDim2.new(0, 10, 0, 10)
        }, {
            Cursor = v2.createElement(v3, {
                cursorType = v5, 
                isVisible = true
            })
        })
    });
end;
local v7 = {};
for _, v9 in v4 do
    v7[v9] = v6(v9);
end;
return {
    summary = "Selection cursors for different types of UI elements", 
    stories = v7
};
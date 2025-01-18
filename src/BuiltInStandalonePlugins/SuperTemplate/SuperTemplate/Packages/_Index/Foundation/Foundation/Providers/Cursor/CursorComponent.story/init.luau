local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CursorComponent);
return {
    summary = "Selection cursors for different types of UI elements", 
    story = function(v3) --[[ Line: 9 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy), v2 (copy)
        local l_controls_0 = v3.controls;
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 100, 0, 50)
        }, {
            Frame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -20, 1, -20), 
                Position = UDim2.new(0, 10, 0, 10)
            }, {
                Cursor = v1.createElement(v2, {
                    cornerRadius = UDim.new(0, l_controls_0.cornerRadius), 
                    offset = l_controls_0.offset, 
                    borderWidth = l_controls_0.borderWidth, 
                    isVisible = true
                })
            })
        });
    end, 
    controls = {
        cornerRadius = 8, 
        offset = 3, 
        borderWidth = 2
    }
};
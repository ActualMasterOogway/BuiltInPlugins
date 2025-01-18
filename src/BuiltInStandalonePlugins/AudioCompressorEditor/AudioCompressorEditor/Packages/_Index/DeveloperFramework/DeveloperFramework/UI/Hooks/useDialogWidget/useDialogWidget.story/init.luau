local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.UI.Components.IconButton);
local v3 = require(script.Parent);
return {
    story = v1.createElement(function() --[[ Line: 11 ]] --[[ Name: UseDialogWidgetStory ]]
        -- upvalues: v1 (copy), v3 (copy), v2 (copy)
        local v4, v5 = v1.useState(false);
        local v6, v7, v8 = v3({
            Contents = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Text = "HELLO!", 
                TextScaled = true
            }), 
            Size = Vector2.new(400, 400), 
            Modal = v4
        });
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            [v1.Tag] = "X-Column X-Fit"
        }, {
            v1.createElement(v2, {
                OnClick = function() --[[ Line: 29 ]] --[[ Name: OnClick ]]
                    -- upvalues: v8 (copy), v7 (copy), v6 (copy)
                    if v8 then
                        v7();
                        return;
                    else
                        v6();
                        return;
                    end;
                end, 
                Text = ("%* Dialog Widget"):format(v8 and "Hide" or "Show")
            }), 
            v1.createElement(v2, {
                OnClick = function() --[[ Line: 39 ]] --[[ Name: OnClick ]]
                    -- upvalues: v5 (copy)
                    v5(function(v9) --[[ Line: 40 ]]
                        return not v9;
                    end);
                end, 
                Text = ("Modal: %*"):format(v4 and "ON" or "OFF")
            })
        });
    end)
};
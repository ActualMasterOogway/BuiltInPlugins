local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.Dialog);
ResizingDialog = function() --[[ Line: 8 ]] --[[ Name: ResizingDialog ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v4, v5 = v1.useState(false);
    local v6, v7 = v1.useState(1);
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v7 (copy)
        local v9 = task.spawn(function() --[[ Line: 13 ]]
            -- upvalues: v7 (ref)
            while true do
                task.wait(0.25);
                v7(function(v8) --[[ Line: 16 ]]
                    return v8 % 3 + 1;
                end);
            end;
        end);
        return function() --[[ Line: 22 ]]
            -- upvalues: v9 (copy)
            task.cancel(v9);
        end;
    end, {});
    return v1.createElement(v2, {
        Style = "Round", 
        Text = "Open Dialog", 
        Size = UDim2.fromOffset(120, 32), 
        OnClick = function() --[[ Line: 31 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (copy)
            v5(true);
        end
    }, {
        Dialog = v1.createElement(v3, {
            Title = "Resizing Dialog", 
            Enabled = v4, 
            Size = Vector2.new(300, v6 * 100), 
            OnClose = function() --[[ Line: 39 ]] --[[ Name: OnClose ]]
                -- upvalues: v5 (copy)
                v5(false);
            end, 
            Modal = true
        })
    });
end;
return ResizingDialog;
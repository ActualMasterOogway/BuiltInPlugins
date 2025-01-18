local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_joinTags_0 = v2.Styling.joinTags;
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useViewportPosition);
local l_UserInputService_0 = game:GetService("UserInputService");
local v7 = {
    Width = 0, 
    Height = 0, 
    Position = UDim2.fromOffset(0, 0)
};
return function(v8) --[[ Line: 27 ]] --[[ Name: PopoverBase ]]
    -- upvalues: v3 (copy), v7 (copy), v1 (copy), v5 (copy), l_UserInputService_0 (copy), l_joinTags_0 (copy)
    local v9 = v3.Dictionary.join(v7, v8);
    local v10, v11 = v1.useState(Vector2.new(v9.Width, v9.Height));
    local v12 = v5(v9.Position, v10.X, v10.Y);
    local v13 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy), l_UserInputService_0 (ref), v13 (copy)
        local v14 = not v9.DebounceFocusLost;
        local v17 = l_UserInputService_0.InputEnded:Connect(function(v15, _) --[[ Line: 36 ]]
            -- upvalues: v9 (ref), v14 (ref), v13 (ref)
            if v15.KeyCode == Enum.KeyCode.Escape then
                v9.OnFocusLost();
                return;
            else
                if v15.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not v14 then
                        v14 = true;
                        return;
                    elseif not v13.current then
                        v9.OnFocusLost();
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 47 ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end;
    end, {
        v9.OnFocusLost
    });
    return v1.createElement("Frame", {
        Position = v12, 
        Size = UDim2.fromOffset(v9.Width, v9.Height), 
        [v1.Event.MouseEnter] = function() --[[ Line: 55 ]]
            -- upvalues: v13 (copy)
            v13.current = true;
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 58 ]]
            -- upvalues: v13 (copy)
            v13.current = false;
        end, 
        [v1.Change.AbsoluteSize] = function(v18) --[[ Line: 61 ]]
            -- upvalues: v11 (copy)
            v11(v18.AbsoluteSize);
        end, 
        [v1.Tag] = l_joinTags_0("Component-PopoverBase X-Center X-ColumnM", v9[v1.Tag])
    }, v9.children);
end;
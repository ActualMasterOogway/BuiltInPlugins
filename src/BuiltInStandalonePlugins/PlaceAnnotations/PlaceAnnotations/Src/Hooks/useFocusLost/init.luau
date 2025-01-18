local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Focus_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Focus;
local v3 = require(l_script_FirstAncestor_0.Src.Contexts.InputListenerContext);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: useFocusLost ]]
    -- upvalues: v3 (copy), l_Focus_0 (copy), v1 (copy)
    local v6 = v3:use();
    local v7 = l_Focus_0:use():get();
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v7 (copy), v4 (copy), v5 (copy)
        v6:setFocus(v7);
        local v9 = v6.Listener.InputBegan:Connect(function(v8) --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v5 (ref)
            if v8.UserInputType == Enum.UserInputType.MouseButton1 and not v4 then
                v5();
            end;
        end);
        return function() --[[ Line: 20 ]]
            -- upvalues: v9 (copy)
            v9:Disconnect();
        end;
    end, {
        v4, 
        v5
    });
end;
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.types);
local l_Workspace_0 = game:GetService("Workspace");
return function(v3) --[[ Line: 10 ]] --[[ Name: getDebugFlags ]]
    -- upvalues: l_Workspace_0 (copy)
    v3 = v3 or "";
    local v4 = l_Workspace_0:FindFirstChild(v3 .. "Flags") or l_Workspace_0:FindFirstChild(v3 .. "DebugFlags");
    return (setmetatable({}, {
        __index = function(_, v6) --[[ Line: 17 ]] --[[ Name: __index ]]
            -- upvalues: v4 (copy)
            if not v4 then
                return nil;
            else
                local l_v4_FirstChild_0 = v4:FindFirstChild(v6);
                if not l_v4_FirstChild_0 then
                    return nil;
                else
                    local v8 = true;
                    if l_v4_FirstChild_0.ClassName ~= "StringValue" then
                        v8 = true;
                        if l_v4_FirstChild_0.ClassName ~= "BoolValue" then
                            v8 = l_v4_FirstChild_0.ClassName == "IntValue";
                        end;
                    end;
                    if v8 then
                        return l_v4_FirstChild_0.Value;
                    else
                        return nil;
                    end;
                end;
            end;
        end
    }));
end;
local v0 = {
    Branch = 5923556358, 
    Consumer = 5923556689, 
    Fragment = 5923557006, 
    Functional = 5923557211, 
    Portal = 5923557429, 
    Provider = 5923557657, 
    Pure = 5923557814, 
    Stateful = 5923557987
};
local function v2(v1) --[[ Line: 12 ]] --[[ Name: getClassIcon ]]
    return game:GetService("StudioService"):GetClassIcon(v1);
end;
return function(v3) --[[ Line: 17 ]] --[[ Name: getInspectorIcon ]]
    -- upvalues: v0 (copy), v2 (copy)
    if v0[v3] then
        return {
            Image = "rbxassetid://" .. v0[v3], 
            ImageRectSize = Vector2.new(24, 24), 
            ImageRectOffset = Vector2.new(0, 0)
        };
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
            -- upvalues: v2 (ref), v3 (copy)
            return v2(v3);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return v2("Folder");
        end;
    end;
end;
local v0 = {};
v0.__index = v0;
v0.GetFullName = function(v1) --[[ Line: 4 ]] --[[ Name: GetFullName ]]
    return v1.FileName;
end;
v0.new = function(v2, v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4 = {
        ScriptGuid = v2, 
        FileName = v3
    };
    setmetatable(v4, v0);
    return v4;
end;
return v0;
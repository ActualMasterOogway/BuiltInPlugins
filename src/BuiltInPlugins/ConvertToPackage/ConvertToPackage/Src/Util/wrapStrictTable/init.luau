local v0 = nil;
local v4 = {
    __index = function(v1, v2) --[[ Line: 6 ]] --[[ Name: __index ]]
        -- upvalues: v0 (ref)
        if not v2 then
            error("key is nil in wrapStrictTable __index");
        end;
        local v3 = v1.__tbl[v2];
        if v3 ~= nil then
            if type(v3) == "table" then
                return v0(v3, v1.__name .. "." .. v2);
            else
                return v3;
            end;
        else
            error(("%q is not a valid key in %s"):format(tostring(v2), (tostring(v1.__name))), 2);
            return;
        end;
    end
};
v0 = function(v5, v6) --[[ Line: 21 ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        __name = v6 or "", 
        __tbl = v5
    }, v4));
end;
return v0;
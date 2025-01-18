local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageFixLastViewed)();
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return "";
    else
        assert(v2, "Luau: Ensure this is defined");
        local v4 = DateTime.fromIsoDate(v2);
        if not v4 then
            return "";
        else
            assert(v4, "Luau: Ensure this is defined");
            if v1 then
                return (v4:FormatUniversalTime("L LT", v3.getLocale()));
            else
                return (v4:FormatLocalTime("L LT", "en-us"));
            end;
        end;
    end;
end;
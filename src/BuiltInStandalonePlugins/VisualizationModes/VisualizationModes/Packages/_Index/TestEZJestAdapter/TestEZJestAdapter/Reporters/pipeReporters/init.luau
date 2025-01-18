local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return function(v2) --[[ Line: 9 ]] --[[ Name: pipeReporters ]]
    return {
        report = function(...) --[[ Line: 11 ]] --[[ Name: report ]]
            -- upvalues: v2 (copy)
            for _, v4 in ipairs(v2) do
                v4.report(...);
            end;
        end
    };
end;
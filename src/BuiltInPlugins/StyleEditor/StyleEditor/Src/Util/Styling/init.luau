local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return {
    getStyleInfo = function(v3) --[[ Line: 16 ]] --[[ Name: getStyleInfo ]]
        -- upvalues: l_StylingService_0 (copy)
        assert(v3 and v3:IsA("StyleRule"), "expecting style rule");
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
            -- upvalues: l_StylingService_0 (ref), v3 (copy)
            return (l_StylingService_0:GetStyleInfo(v3));
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end
};
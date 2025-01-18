local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local l_pollUntil_0 = require(l_Packages_0.Framework).Util.pollUntil;
return {
    createMockStudioStyleGuideColor = function() --[[ Line: 9 ]] --[[ Name: createMockStudioStyleGuideColor ]]
        local v2 = {};
        setmetatable(v2, {
            __index = function() --[[ Line: 12 ]] --[[ Name: __index ]]
                return Color3.new(math.random(), math.random(), math.random());
            end
        });
        return v2;
    end, 
    createMockStudioStyleGuideModifier = function() --[[ Line: 19 ]] --[[ Name: createMockStudioStyleGuideModifier ]]
        local v3 = {};
        setmetatable(v3, {
            __index = function() --[[ Line: 22 ]] --[[ Name: __index ]]
                return nil;
            end
        });
        return v3;
    end, 
    pollAssertionUntil = function(v4, v5) --[[ Line: 31 ]] --[[ Name: pollAssertionUntil ]]
        -- upvalues: l_pollUntil_0 (copy)
        local v6 = nil;
        return l_pollUntil_0(function() --[[ Line: 34 ]]
            -- upvalues: v4 (copy), v6 (ref)
            local l_status_0, l_result_0 = pcall(v4);
            if l_status_0 then
                v6 = nil;
                return true;
            else
                v6 = l_result_0;
                return false;
            end;
        end, v5):catch(function() --[[ Line: 45 ]]
            -- upvalues: v5 (copy), v6 (ref)
            error(string.format("pollAssertionUntil failed after %ds:\n%s", v5 or 1, (tostring(v6))));
        end):await();
    end
};
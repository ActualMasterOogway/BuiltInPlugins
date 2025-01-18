local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Network.Http);
local l_HttpService_0 = game:GetService("HttpService");
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local function v9(v4, v5) --[[ Line: 8 ]] --[[ Name: fetchSingleCreatorEligibility ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    local v6 = {
        Url = v1.BuildRobloxUrl("apis", "experience-guidelines-service/v1beta1/multi-creator-eligibility"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            action = 1, 
            universeId = v4, 
            userIds = {
                v5
            }
        })
    };
    return v1.Request(v6):andThen(function(v7) --[[ Line: 19 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (copy)
        local v8 = l_HttpService_0:JSONDecode(v7);
        assert(#v8.eligibilityByCreator == 1);
        return {
            userIsEligible = v8.eligibilityByCreator[1].userIsEligible, 
            universeId = v4
        };
    end);
end;
return function(v10, v11) --[[ Line: 27 ]]
    -- upvalues: v9 (copy), l_Promise_0 (copy)
    local v12 = {};
    for _, v14 in pairs(v10) do
        table.insert(v12, v9(v14, v11));
    end;
    return l_Promise_0.all(v12):andThen(function(v15) --[[ Line: 33 ]]
        local v16 = {};
        for _, v18 in pairs(v15) do
            v16[v18.universeId] = v18.userIsEligible;
        end;
        return v16;
    end);
end;
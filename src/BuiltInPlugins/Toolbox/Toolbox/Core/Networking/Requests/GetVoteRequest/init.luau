local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.GetVote);
local v4 = require(l_Parent_0.Core.Actions.SetVoteLoading);
return function(v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v8 (copy), v6 (copy), v4 (ref), v5 (copy), v7 (copy), v3 (ref), v1 (ref), v2 (ref)
        if v8 then
            local v10 = v9:getState();
            if v10 ~= nil and v10.voting ~= nil and v10.voting[v6] ~= nil then
                if v10.voting[v6].VoteFetchAttempted then
                    return;
                else
                    v9:dispatch(v4(v6, true, true));
                end;
            end;
        end;
        return v5:getVote(v6, v7):andThen(function(v11) --[[ Line: 21 ]]
            -- upvalues: v9 (copy), v3 (ref), v6 (ref), v4 (ref)
            local l_responseBody_0 = v11.responseBody;
            local v13 = if l_responseBody_0 == nil then nil else l_responseBody_0.userVote;
            if v13 ~= nil then
                v9:dispatch(v3(v6, v13));
            end;
            v9:dispatch(v4(v6, false, true));
        end, function(v14) --[[ Line: 29 ]]
            -- upvalues: v1 (ref), v9 (copy), v2 (ref), v4 (ref), v6 (ref)
            if v1.shouldDebugWarnings() then
                warn("Could not get vote data");
            end;
            v9:dispatch(v2(v14));
            v9:dispatch(v4(v6, false, true));
        end);
    end;
end;
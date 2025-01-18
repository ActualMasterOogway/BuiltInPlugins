local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.CollaboratorSearchActions);
local v2 = require(l_Parent_0.Src.Selectors.IsGame17Plus);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v3 (copy), v4 (copy), v2 (ref)
        local v7 = v5:getState();
        local l_gamePermissionsController_0 = v6.gamePermissionsController;
        v5:dispatch(v1.SearchTextChanged(v3));
        if v3 == "" or not v4 then
            return;
        else
            if not v7.CollaboratorSearch.CachedSearchResults[v3] then
                v5:dispatch(v1.LoadWebResults(v3));
                spawn(function() --[[ Line: 24 ]]
                    -- upvalues: l_gamePermissionsController_0 (copy), v3 (ref), v2 (ref), v7 (copy), v5 (copy), v1 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
                        -- upvalues: l_gamePermissionsController_0 (ref), v3 (ref), v2 (ref), v7 (ref)
                        return l_gamePermissionsController_0:search(v3, v2(v7));
                    end);
                    v5:dispatch(v1.LoadedWebResults(l_status_0, v3, l_result_0));
                end);
            end;
            return;
        end;
    end;
end;
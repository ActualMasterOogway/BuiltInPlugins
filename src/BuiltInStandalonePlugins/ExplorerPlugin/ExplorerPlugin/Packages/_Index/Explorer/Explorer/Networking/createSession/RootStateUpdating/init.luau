local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Networking.createSession.ExplorerNode);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Networking.createSession.SessionChildren);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v5 = require(l_script_FirstAncestor_0.Util.isExpanded);
return {
    instanceAdded = function(v6, v7) --[[ Line: 11 ]] --[[ Name: instanceAdded ]]
        -- upvalues: v1 (copy), v3 (copy)
        if v7.parentId == nil then
            error("NYI: Parented to nil");
        end;
        assert(v6.instanceIdsToNodes[v7.id] == nil, "Receiving instance added about instance we already know about");
        local v8 = v6.instanceIdsToNodes[v7.parentId];
        if v8 == nil then
            error((("Instance added to parent we don't know about: %* (datum.id = %*)"):format(v7.parentId, v7.id)));
        end;
        local v9 = v1.createFromDatum(v7);
        v3.insertInto(v6, v8, v9);
        return v9;
    end, 
    instanceReplaced = function(v10, v11) --[[ Line: 34 ]] --[[ Name: instanceReplaced ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v12 = v10.instanceIdsToNodes[v11.id];
        assert(v12 ~= nil, "Replacing instance we don't know about");
        local v13 = v11.parentId ~= (v12.parent and v12.parent.datum.id);
        if v13 then
            v3.remove(v10, v12);
        end;
        if v12.datum.fieldValues ~= nil then
            v11 = table.clone(v11);
            v11.fieldValues = v12.datum.fieldValues;
            v11 = table.freeze(v11);
        end;
        v12.datum = v11;
        if v13 then
            local v14 = v11.parentId and v10.instanceIdsToNodes[v11.parentId];
            if v14 == nil or not v5(v14) then
                v12.parent = nil;
                return;
            else
                v3.insertInto(v10, v14, v12);
            end;
        end;
    end
};
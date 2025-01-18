local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Networking.Requests.GroupRoles);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v5 = require(l_Parent_0.Src.Networking.WebKeyConstants);
local function _(v6) --[[ Line: 27 ]] --[[ Name: getSubjectType ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v6[v5.UserId] then
        return v4.UserSubjectKey;
    elseif v6[v5.RoleId] then
        return v4.RoleSubjectKey;
    elseif v6[v5.GroupId] then
        return v4.GroupSubjectKey;
    else
        error("Could not determine subject type");
        return;
    end;
end;
local function _(v8) --[[ Line: 40 ]] --[[ Name: getInternalAction ]]
    -- upvalues: v5 (copy), v4 (copy)
    if v8 == v5.PlayAction then
        return v4.PlayKey;
    elseif v8 == v5.EditAction then
        return v4.EditKey;
    elseif v8 == v5.AdminAction then
        return v4.EditKey;
    elseif v8 == nil then
        return v4.NoAccessKey;
    else
        error("Unsupported Action: " .. tostring(v8));
        return;
    end;
end;
local v21 = {
    _DEPRECATEDFixEndpointKeyTypes = function(v10) --[[ Line: 56 ]] --[[ Name: _DEPRECATEDFixEndpointKeyTypes ]]
        -- upvalues: v5 (copy)
        for _, v12 in pairs(v10) do
            for v13, v14 in pairs(v12) do
                if v13 == v5.GroupId or v13 == v5.UserId or v13 == v5.RoleId or v13 == v5.RoleRank then
                    v12[v13] = tonumber(v14);
                end;
            end;
        end;
    end, 
    _deserializeOne = function(v15, v16) --[[ Line: 66 ]] --[[ Name: _deserializeOne ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v17 = {};
        local l_ActionKey_0 = v4.ActionKey;
        local v19 = v15[v5.Action];
        local v20;
        if v19 == v5.PlayAction then
            v20 = v4.PlayKey;
        elseif v19 == v5.EditAction then
            v20 = v4.EditKey;
        elseif v19 == v5.AdminAction then
            v20 = v4.EditKey;
        elseif v19 == nil then
            v20 = v4.NoAccessKey;
        else
            error("Unsupported Action: " .. tostring(v19));
            v20 = nil;
        end;
        v17[l_ActionKey_0] = v20;
        l_ActionKey_0 = nil;
        v20 = nil;
        if v16 == v4.UserSubjectKey then
            l_ActionKey_0 = v15[v5.UserName];
            v20 = v15[v5.UserId];
        elseif v16 == v4.GroupSubjectKey then
            l_ActionKey_0 = v15[v5.GroupName];
            v20 = v15[v5.GroupId];
        elseif v16 == v4.RoleSubjectKey then
            l_ActionKey_0 = v15[v5.RoleName];
            v20 = v15[v5.RoleId];
        end;
        v17[v4.SubjectNameKey] = l_ActionKey_0;
        v17[v4.SubjectIdKey] = v20;
        v19 = v15[v5.AllowedPermissions];
        if v16 == v4.UserSubjectKey then
            if not v19 or v19 == "" or v19 == "Play" then
                v17[v4.IsFriendKey] = false;
            else
                v17[v4.IsFriendKey] = true;
            end;
        end;
        if v16 == v4.RoleSubjectKey then
            v17[v4.SubjectRankKey] = v15[v5.RoleRank];
            v17[v4.GroupIdKey] = v15[v5.GroupId];
        end;
        return v17;
    end
};
v21._deserializeAll = function(v22) --[[ Line: 103 ]] --[[ Name: _deserializeAll ]]
    -- upvalues: v4 (copy), v5 (copy), v21 (copy)
    local v23 = {};
    local v24 = {
        [v4.UserSubjectKey] = {}, 
        [v4.RoleSubjectKey] = {}
    };
    for _, v26 in pairs(v22) do
        local v27;
        if v26[v5.UserId] then
            v27 = v4.UserSubjectKey;
        elseif v26[v5.RoleId] then
            v27 = v4.RoleSubjectKey;
        elseif v26[v5.GroupId] then
            v27 = v4.GroupSubjectKey;
        else
            error("Could not determine subject type");
            v27 = nil;
        end;
        if v27 == v4.GroupSubjectKey then
            local v28 = v21._deserializeOne(v26, v27);
            v23[v28[v4.SubjectIdKey]] = {
                Name = v28[v4.SubjectNameKey]
            };
        end;
    end;
    for _, v30 in pairs(v22) do
        local v31;
        if v30[v5.UserId] then
            v31 = v4.UserSubjectKey;
        elseif v30[v5.RoleId] then
            v31 = v4.RoleSubjectKey;
        elseif v30[v5.GroupId] then
            v31 = v4.GroupSubjectKey;
        else
            error("Could not determine subject type");
            v31 = nil;
        end;
        local v32 = v21._deserializeOne(v30, v31);
        local v33 = v32[v4.SubjectIdKey];
        if v31 ~= v4.GroupSubjectKey and (v32[v4.SubjectRankKey] ~= 0 or v32[v4.ActionKey] ~= v4.NoAccessKey) then
            v24[v31][v33] = v32;
        end;
    end;
    return v24, v23;
end;
v21._addOwnerIfMissing = function(v34, v35, v36, v37) --[[ Line: 143 ]] --[[ Name: _addOwnerIfMissing ]]
    -- upvalues: v5 (copy), l_Promise_0 (copy), v3 (copy), v2 (copy)
    local v38 = v37 == Enum.CreatorType.User and v5.UserId or v5.GroupId;
    local v39 = false;
    for _, v41 in pairs(v34) do
        if v41[v38] == v36 then
            v39 = true;
            break;
        end;
    end;
    if v39 then
        return l_Promise_0.new(function(v42) --[[ Line: 154 ]]
            v42();
        end);
    elseif v37 == Enum.CreatorType.User then
        table.insert(v34, {
            [v5.UserId] = v36, 
            [v5.UserName] = v35, 
            [v5.Action] = v5.EditAction
        });
        return l_Promise_0.new(function(v43) --[[ Line: 166 ]]
            v43();
        end);
    else
        table.insert(v34, {
            [v5.GroupId] = v36, 
            [v5.GroupName] = v35, 
            [v5.Action] = nil
        });
        return v3.Get(v36):andThen(function(v44) --[[ Line: 176 ]]
            -- upvalues: v5 (ref), v34 (copy), v2 (ref), v36 (copy), v35 (copy)
            for _, v46 in pairs(v44) do
                if v46[v5.RoleId] == 255 then
                    table.insert(v34, v2.Dictionary.join(v46, {
                        [v5.GroupId] = v36, 
                        [v5.GroupName] = v35, 
                        [v5.Action] = v5.EditAction
                    }));
                else
                    table.insert(v34, v2.Dictionary.join(v46, {
                        [v5.GroupId] = v36, 
                        [v5.GroupName] = v35, 
                        [v5.Action] = nil
                    }));
                end;
            end;
        end);
    end;
end;
v21.DeserializePermissions = function(v47, v48, v49, v50) --[[ Line: 202 ]] --[[ Name: DeserializePermissions ]]
    -- upvalues: v21 (copy)
    v21._DEPRECATEDFixEndpointKeyTypes(v47);
    v21._addOwnerIfMissing(v47, v48, v49, v50):await();
    local v51, v52 = v21._deserializeAll(v47);
    return v51, v52;
end;
return v21;
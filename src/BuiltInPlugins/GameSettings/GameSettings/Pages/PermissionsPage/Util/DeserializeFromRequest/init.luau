local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_1.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_1.Packages.Cryo);
local v4 = require(l_Parent_1.Src.Networking.Requests.Permissions.GroupRoles);
local v5 = require(l_Parent_0.Util.PermissionsConstants);
local v6 = require(l_Parent_0.Util.WebKeyConstants);
local function _(v7) --[[ Line: 28 ]] --[[ Name: getSubjectType ]]
    -- upvalues: v6 (copy), v5 (copy)
    if v7[v6.UserId] then
        return v5.UserSubjectKey;
    elseif v7[v6.RoleId] then
        return v5.RoleSubjectKey;
    elseif v7[v6.GroupId] then
        return v5.GroupSubjectKey;
    else
        error("Could not determine subject type");
        return;
    end;
end;
local function _(v9) --[[ Line: 41 ]] --[[ Name: getInternalAction ]]
    -- upvalues: v6 (copy), v5 (copy)
    if v9 == v6.PlayAction then
        return v5.PlayKey;
    elseif v9 == v6.EditAction then
        return v5.EditKey;
    elseif v9 == v6.AdminAction then
        return v5.EditKey;
    elseif v9 == nil then
        return v5.NoAccessKey;
    else
        error("Unsupported Action: " .. tostring(v9));
        return;
    end;
end;
local v22 = {
    _DEPRECATEDFixEndpointKeyTypes = function(v11) --[[ Line: 61 ]] --[[ Name: _DEPRECATEDFixEndpointKeyTypes ]]
        -- upvalues: v6 (copy)
        for _, v13 in pairs(v11) do
            for v14, v15 in pairs(v13) do
                if v14 == v6.GroupId or v14 == v6.UserId or v14 == v6.RoleId or v14 == v6.RoleRank then
                    v13[v14] = tonumber(v15);
                end;
            end;
        end;
    end, 
    _deserializeOne = function(v16, v17) --[[ Line: 71 ]] --[[ Name: _deserializeOne ]]
        -- upvalues: v5 (copy), v6 (copy)
        local v18 = {};
        local l_ActionKey_0 = v5.ActionKey;
        local v20 = v16[v6.Action];
        local v21;
        if v20 == v6.PlayAction then
            v21 = v5.PlayKey;
        elseif v20 == v6.EditAction then
            v21 = v5.EditKey;
        elseif v20 == v6.AdminAction then
            v21 = v5.EditKey;
        elseif v20 == nil then
            v21 = v5.NoAccessKey;
        else
            error("Unsupported Action: " .. tostring(v20));
            v21 = nil;
        end;
        v18[l_ActionKey_0] = v21;
        l_ActionKey_0 = nil;
        v21 = nil;
        if v17 == v5.UserSubjectKey then
            l_ActionKey_0 = v16[v6.UserName];
            v21 = v16[v6.UserId];
        elseif v17 == v5.GroupSubjectKey then
            l_ActionKey_0 = v16[v6.GroupName];
            v21 = v16[v6.GroupId];
        elseif v17 == v5.RoleSubjectKey then
            l_ActionKey_0 = v16[v6.RoleName];
            v21 = v16[v6.RoleId];
        end;
        v18[v5.SubjectNameKey] = l_ActionKey_0;
        v18[v5.SubjectIdKey] = v21;
        v20 = v16[v6.AllowedPermissions];
        if v17 == v5.UserSubjectKey then
            if not v20 or v20 == "" or v20 == "Play" then
                v18[v5.IsFriendKey] = false;
            else
                v18[v5.IsFriendKey] = true;
            end;
        end;
        if v17 == v5.RoleSubjectKey then
            v18[v5.SubjectRankKey] = v16[v6.RoleRank];
            v18[v5.GroupIdKey] = v16[v6.GroupId];
        end;
        return v18;
    end
};
v22._deserializeAll = function(v23) --[[ Line: 108 ]] --[[ Name: _deserializeAll ]]
    -- upvalues: v5 (copy), v6 (copy), v22 (copy)
    local v24 = {};
    local v25 = {
        [v5.UserSubjectKey] = {}, 
        [v5.RoleSubjectKey] = {}
    };
    for _, v27 in pairs(v23) do
        local v28;
        if v27[v6.UserId] then
            v28 = v5.UserSubjectKey;
        elseif v27[v6.RoleId] then
            v28 = v5.RoleSubjectKey;
        elseif v27[v6.GroupId] then
            v28 = v5.GroupSubjectKey;
        else
            error("Could not determine subject type");
            v28 = nil;
        end;
        if v28 == v5.GroupSubjectKey then
            local v29 = v22._deserializeOne(v27, v28);
            local v30 = v29[v5.SubjectIdKey];
            local v31 = v29[v5.SubjectNameKey];
            local _ = v29[v5.ActionKey];
            v24[v30] = {
                Name = v31
            };
        end;
    end;
    for _, v34 in pairs(v23) do
        local v35;
        if v34[v6.UserId] then
            v35 = v5.UserSubjectKey;
        elseif v34[v6.RoleId] then
            v35 = v5.RoleSubjectKey;
        elseif v34[v6.GroupId] then
            v35 = v5.GroupSubjectKey;
        else
            error("Could not determine subject type");
            v35 = nil;
        end;
        local v36 = v22._deserializeOne(v34, v35);
        local v37 = v36[v5.SubjectIdKey];
        if v35 ~= v5.GroupSubjectKey and (v36[v5.SubjectRankKey] ~= 0 or v36[v5.ActionKey] ~= v5.NoAccessKey) then
            v25[v35][v37] = v36;
        end;
    end;
    return v25, v24;
end;
v22._addOwnerIfMissing = function(v38, v39, v40, v41) --[[ Line: 149 ]] --[[ Name: _addOwnerIfMissing ]]
    -- upvalues: v6 (copy), l_Promise_0 (copy), v4 (copy), v3 (copy)
    local v42 = v41 == Enum.CreatorType.User and v6.UserId or v6.GroupId;
    local v43 = false;
    for _, v45 in pairs(v38) do
        if v45[v42] == v40 then
            v43 = true;
            break;
        end;
    end;
    if v43 then
        return l_Promise_0.new(function(v46) --[[ Line: 160 ]]
            v46();
        end);
    elseif v41 == Enum.CreatorType.User then
        table.insert(v38, {
            [v6.UserId] = v40, 
            [v6.UserName] = v39, 
            [v6.Action] = v6.EditAction
        });
        return l_Promise_0.new(function(v47) --[[ Line: 172 ]]
            v47();
        end);
    else
        table.insert(v38, {
            [v6.GroupId] = v40, 
            [v6.GroupName] = v39, 
            [v6.Action] = nil
        });
        return v4.Get(v40):andThen(function(v48) --[[ Line: 182 ]]
            -- upvalues: v6 (ref), v38 (copy), v3 (ref), v40 (copy), v39 (copy)
            for _, v50 in pairs(v48) do
                if v50[v6.RoleId] == 255 then
                    table.insert(v38, v3.Dictionary.join(v50, {
                        [v6.GroupId] = v40, 
                        [v6.GroupName] = v39, 
                        [v6.Action] = v6.EditAction
                    }));
                else
                    table.insert(v38, v3.Dictionary.join(v50, {
                        [v6.GroupId] = v40, 
                        [v6.GroupName] = v39, 
                        [v6.Action] = nil
                    }));
                end;
            end;
        end);
    end;
end;
v22.DeserializePermissions = function(v51, v52, v53, v54) --[[ Line: 208 ]] --[[ Name: DeserializePermissions ]]
    -- upvalues: v22 (copy)
    v22._DEPRECATEDFixEndpointKeyTypes(v51);
    v22._addOwnerIfMissing(v51, v52, v53, v54):await();
    local v55, v56 = v22._deserializeAll(v51);
    return v55, v56;
end;
return v22;
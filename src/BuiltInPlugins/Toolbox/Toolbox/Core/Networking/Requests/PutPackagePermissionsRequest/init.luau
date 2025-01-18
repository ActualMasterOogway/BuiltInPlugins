local _ = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v3 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
local v5 = require(l_Parent_0.Core.Actions.ClearChange);
local v6 = require(l_Parent_0.Core.Actions.NetworkError);
local v7 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local v11 = v3.getWebAction(v2.NoAccessKey);
local function v29(v12, v13, v14) --[[ Line: 26 ]] --[[ Name: serializeForRequest ]]
    -- upvalues: v2 (copy), l_webKeys_0 (copy), v3 (copy)
    local v15 = {
        [v2.GroupSubjectKey] = {}
    };
    if v12 and next(v12) ~= nil then
        for v16, _ in pairs(v12) do
            v15[v16] = {};
        end;
        for v18, v19 in pairs(v12) do
            for v20, v21 in pairs(v19) do
                v15[v18][v20] = {
                    Action = v21[v2.ActionKey]
                };
            end;
        end;
    end;
    if v13 and next(v13) ~= nil then
        for v22, v23 in pairs(v13) do
            v15[v2.GroupSubjectKey][v22] = v15[v2.GroupSubjectKey][v22] or {};
            v15[v2.GroupSubjectKey][v22] = {
                Action = v23.Action
            };
        end;
    end;
    local v24 = {};
    for v25, v26 in pairs(v15) do
        for v27, v28 in pairs(v26) do
            table.insert(v24, {
                [l_webKeys_0.SubjectType] = v3.getWebSubjectType(v25), 
                [l_webKeys_0.SubjectId] = v27, 
                [l_webKeys_0.Action] = v3.getWebAction(v28.Action), 
                [l_webKeys_0.UpToVersion] = v14
            });
        end;
    end;
    return v24;
end;
local function v37(v30, v31) --[[ Line: 66 ]] --[[ Name: serializeForGrantAssetPermissionRequest ]]
    -- upvalues: v29 (copy), l_webKeys_0 (copy), v11 (copy), v3 (copy)
    local v32 = v29(v30, v31);
    local v33 = {
        [l_webKeys_0.Requests] = {}
    };
    local v34 = v33[l_webKeys_0.Requests];
    for _, v36 in pairs(v32) do
        if v36[l_webKeys_0.Action] ~= v11 then
            table.insert(v34, {
                [l_webKeys_0.SubjectType] = v3.getAssetPermissionSubjectType(v36[l_webKeys_0.SubjectType]), 
                [l_webKeys_0.SubjectId] = v36[l_webKeys_0.SubjectId], 
                [l_webKeys_0.Action] = v3.getAssetPermissionAction(v36[l_webKeys_0.Action])
            });
        end;
    end;
    return v33;
end;
local function v51(v38, v39, v40) --[[ Line: 86 ]] --[[ Name: serializeForRevokeAssetPermissionRequest ]]
    -- upvalues: v29 (copy), l_webKeys_0 (copy), v3 (copy), v11 (copy)
    local v41 = v29(v38, v39);
    local v42 = v29(v40, v39);
    local v43 = {};
    local v44 = {
        [l_webKeys_0.Requests] = {}
    };
    local v45 = v44[l_webKeys_0.Requests];
    for _, v47 in pairs(v42) do
        v43[v47[l_webKeys_0.SubjectId]] = v3.getAssetPermissionAction(v47[l_webKeys_0.Action]);
    end;
    for _, v49 in pairs(v41) do
        if v49[l_webKeys_0.Action] == v11 then
            local v50 = v43[v49[l_webKeys_0.SubjectId]];
            table.insert(v45, {
                [l_webKeys_0.SubjectType] = v3.getAssetPermissionSubjectType(v49[l_webKeys_0.SubjectType]), 
                [l_webKeys_0.SubjectId] = v49[l_webKeys_0.SubjectId], 
                [l_webKeys_0.Action] = v50
            });
        end;
    end;
    return v44;
end;
return function(v52, v53, _) --[[ Line: 114 ]]
    -- upvalues: v37 (copy), v51 (copy), l_webKeys_0 (copy), l_Promise_0 (copy), l_NewPackageAnalyticsWithRefactor2_0 (copy), v7 (copy), v5 (copy), v6 (copy)
    return function(v55) --[[ Line: 115 ]]
        -- upvalues: v37 (ref), v51 (ref), l_webKeys_0 (ref), l_Promise_0 (ref), v52 (copy), v53 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref), v7 (ref), v5 (ref), v6 (ref)
        local l_changed_0 = v55:getState().changed;
        if l_changed_0 and next(l_changed_0) ~= nil then
            local l_originalCollaborators_0 = v55:getState().originalCollaborators;
            local v58 = v37(l_changed_0.permissions, l_changed_0.groupMetadata);
            local v59 = v51(l_changed_0.permissions, l_changed_0.groupMetadata, l_originalCollaborators_0);
            local v60 = next(v58[l_webKeys_0.Requests]) == nil and l_Promise_0.resolve(true) or v52:grantAssetPermissions(v53, v58);
            local v61 = next(v59[l_webKeys_0.Requests]) == nil and l_Promise_0.resolve(true) or v52:revokeAssetPermissions(v53, v59);
            return l_Promise_0.all({
                v60, 
                v61
            }):andThen(function(v62) --[[ Line: 135 ]]
                -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v7 (ref), v55 (copy), v5 (ref)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    for _, v64 in pairs(v62) do
                        if v64.url ~= nil then
                            v7.sendResultToKibana(v64);
                        end;
                    end;
                end;
                v55:dispatch(v5("permissions"));
                v55:dispatch(v5("groupMetadata"));
            end, function(v65) --[[ Line: 146 ]]
                -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v7 (ref), v55 (copy), v6 (ref)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    v7.sendResultToKibana(v65);
                end;
                v55:dispatch(v6(v65));
            end);
        else
            return;
        end;
    end;
end;
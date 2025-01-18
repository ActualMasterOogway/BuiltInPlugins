local _ = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v4 = require(l_Actions_0.SetCollaborators);
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Framework).Util.Promise;
local v9 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local v10 = require(l_Parent_0.Core.Util.Permissions.Constants);
local l_webKeys_0 = v10.webKeys;
local _ = v10.webValues;
local _ = game:GetService("ProximityPromptService");
local l_Players_0 = game:GetService("Players");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local _ = function(v16) --[[ Line: 29 ]] --[[ Name: DEPRECATED_deserializeResult ]]
    -- upvalues: v6 (copy), l_webKeys_0 (copy), l_Players_0 (copy), v9 (copy)
    local v17 = {
        [v6.UserSubjectKey] = {}, 
        [v6.RoleSubjectKey] = {}
    };
    for _, v19 in pairs(v16) do
        if v19[l_webKeys_0.SubjectType] == l_webKeys_0.UserSubject then
            v17[v6.UserSubjectKey][v19[l_webKeys_0.SubjectId]] = {
                [v6.SubjectNameKey] = l_Players_0:GetNameFromUserIdAsync(v19[l_webKeys_0.SubjectId]), 
                [v6.SubjectIdKey] = v19[l_webKeys_0.SubjectId], 
                [v6.ActionKey] = v9.getInternalAction(v19[l_webKeys_0.Action])
            };
        else
            v17[v6.RoleSubjectKey][v19[l_webKeys_0.SubjectId]] = {
                [v6.ActionKey] = v9.getInternalAction(v19[l_webKeys_0.Action])
            };
        end;
    end;
    return v17;
end;
local function v27(v21) --[[ Line: 54 ]] --[[ Name: deserializeResponse ]]
    -- upvalues: v6 (copy), l_webKeys_0 (copy), l_Players_0 (copy), v9 (copy)
    local v22 = {
        [v6.UserSubjectKey] = {}, 
        [v6.RoleSubjectKey] = {}
    };
    for _, v24 in pairs(v21.results) do
        if v24[l_webKeys_0.SubjectType] == l_webKeys_0.UserSubject then
            v22[v6.UserSubjectKey][v24[l_webKeys_0.SubjectId]] = {
                [v6.SubjectNameKey] = l_Players_0:GetNameFromUserIdAsync(v24[l_webKeys_0.SubjectId]), 
                [v6.SubjectIdKey] = v24[l_webKeys_0.SubjectId], 
                [v6.ActionKey] = v9.getInternalAction(v24[l_webKeys_0.Action])
            };
        else
            local v25 = v24[l_webKeys_0.SubjectId];
            if v25 and v25 ~= "" then
                v22[v6.RoleSubjectKey][tonumber(v25)] = {
                    [v6.ActionKey] = v9.getInternalAction(v24[l_webKeys_0.Action])
                };
                local v26 = v22[v6.RoleSubjectKey][tonumber(v25)];
                v26[v6.PermissionLevelKey] = v24[l_webKeys_0.PermissionLevel] and v9.getPermissionLevel(v24[l_webKeys_0.PermissionLevel]) or nil;
                v26[v6.PermissionSourceKey] = v24[l_webKeys_0.PermissionSource] and v9.getPermissionSource(v24[l_webKeys_0.PermissionSource]) or nil;
            end;
        end;
    end;
    return v22;
end;
return function(v28, v29) --[[ Line: 90 ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), v3 (copy), v27 (copy), v4 (copy), v5 (copy)
    return function(v30) --[[ Line: 91 ]]
        -- upvalues: v28 (copy), v29 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v27 (ref), v4 (ref), v5 (ref)
        return v28:getAssetPermissions(v29):andThen(function(v31) --[[ Line: 92 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v27 (ref), v30 (copy), v4 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v31);
            end;
            local v32 = v27(v31.responseBody);
            v30:dispatch(v4(v32));
        end, function(v33) --[[ Line: 99 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), v3 (ref), v30 (copy), v5 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v33);
            end;
            v30:dispatch(v5(v33));
        end);
    end;
end;
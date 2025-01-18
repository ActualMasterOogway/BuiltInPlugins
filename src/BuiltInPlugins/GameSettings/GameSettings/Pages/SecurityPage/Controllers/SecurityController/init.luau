local v0 = {};
v0.__index = v0;
local l_game_EngineFeature_0 = game:GetEngineFeature("EditableServiceEnabled");
v0.new = function(v2) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v2
    }, v0));
end;
v0.configurationV2GET = function(v3, v4) --[[ Line: 15 ]] --[[ Name: configurationV2GET ]]
    return v3.__networking:get("develop", "/v2/universes/" .. v4 .. "/configuration"):await();
end;
v0.configurationV2PATCH = function(v5, v6, v7) --[[ Line: 19 ]] --[[ Name: configurationV2PATCH ]]
    return v5.__networking:patch("develop", "/v2/universes/" .. v6 .. "/configuration", {
        Body = v7
    }):await();
end;
v0.GetPermission = function(v8, v9, v10) --[[ Line: 27 ]] --[[ Name: GetPermission ]]
    return v8:configurationV2GET(v9).responseBody.permissions[v10];
end;
v0.SetChangedPermissions = function(v11, v12, v13, v14) --[[ Line: 33 ]] --[[ Name: SetChangedPermissions ]]
    return v11:configurationV2PATCH(v12, {
        permissions = {
            [v13] = v14
        }
    });
end;
v0.GetThirdPartyPurchasesAllowed = function(v15, v16) --[[ Line: 41 ]] --[[ Name: GetThirdPartyPurchasesAllowed ]]
    return v15:GetPermission(v16, "IsThirdPartyPurchaseAllowed");
end;
v0.SetThirdPartyPurchasesAllowed = function(v17, v18, v19) --[[ Line: 45 ]] --[[ Name: SetThirdPartyPurchasesAllowed ]]
    return v17:SetChangedPermissions(v18, "IsThirdPartyPurchaseAllowed", v19);
end;
v0.GetThirdPartyTeleportsAllowed = function(v20, v21) --[[ Line: 49 ]] --[[ Name: GetThirdPartyTeleportsAllowed ]]
    return v20:GetPermission(v21, "IsThirdPartyTeleportAllowed");
end;
v0.SetThirdPartyTeleportsAllowed = function(v22, v23, v24) --[[ Line: 53 ]] --[[ Name: SetThirdPartyTeleportsAllowed ]]
    return v22:SetChangedPermissions(v23, "IsThirdPartyTeleportAllowed", v24);
end;
v0.GetHttpEnabled = function(_, v26) --[[ Line: 57 ]] --[[ Name: GetHttpEnabled ]]
    return v26:GetService("HttpService"):GetHttpEnabled();
end;
v0.SetHttpEnabled = function(_, v28, v29) --[[ Line: 62 ]] --[[ Name: SetHttpEnabled ]]
    return v28:GetService("HttpService"):SetHttpEnabled(v29);
end;
v0.GetStudioAccessToApisAllowed = function(v30, v31) --[[ Line: 67 ]] --[[ Name: GetStudioAccessToApisAllowed ]]
    return v30:configurationV2GET(v31).responseBody.studioAccessToApisAllowed;
end;
v0.SetStudioAccessToApisAllowed = function(v32, v33, v34) --[[ Line: 73 ]] --[[ Name: SetStudioAccessToApisAllowed ]]
    return v32:configurationV2PATCH(v33, {
        studioAccessToApisAllowed = v34
    });
end;
v0.GetSecrets = function(_) --[[ Line: 79 ]] --[[ Name: GetSecrets ]]
    return game:GetService("StudioService").Secrets;
end;
v0.SetSecrets = function(_, v37) --[[ Line: 84 ]] --[[ Name: SetSecrets ]]
    game:GetService("StudioService").Secrets = v37;
end;
if l_game_EngineFeature_0 then
    local l_Parent_0 = script.Parent.Parent.Parent.Parent;
    local v39 = require(l_Parent_0.Src.Networking.Http);
    local l_HttpService_0 = game:GetService("HttpService");
    local function v44(v41) --[[ Line: 94 ]] --[[ Name: httpGetJson ]]
        -- upvalues: v39 (copy), l_HttpService_0 (copy)
        local v42 = {
            Url = v41, 
            Method = "GET"
        };
        return v39.Request(v42):andThen(function(v43) --[[ Line: 99 ]]
            -- upvalues: l_HttpService_0 (ref)
            return (l_HttpService_0:JSONDecode(v43));
        end);
    end;
    local function _() --[[ Line: 105 ]] --[[ Name: getIdVerificationStatus ]]
        -- upvalues: v39 (copy), v44 (copy)
        local v45 = v39.BuildRobloxUrl("apis", "access-management/v1/feature-access?featureNames=CanEnableMeshTextureApi");
        return v44(v45);
    end;
    local function v51() --[[ Line: 112 ]] --[[ Name: FetchIdVerificationStatus ]]
        -- upvalues: v39 (copy), v44 (copy)
        local function v48(v47) --[[ Line: 113 ]]
            if #v47.features > 0 then
                return true, v47.features[1].access;
            else
                return false, "Denied";
            end;
        end;
        local function v49() --[[ Line: 120 ]]
            return false, "Denied";
        end;
        local v50 = v39.BuildRobloxUrl("apis", "access-management/v1/feature-access?featureNames=CanEnableMeshTextureApi");
        return v44(v50):andThen(v48, v49);
    end;
    v0.GetMeshTextureApiAmpStatus = function(_) --[[ Line: 126 ]] --[[ Name: GetMeshTextureApiAmpStatus ]]
        -- upvalues: v51 (copy)
        local v53, v54 = v51():await();
        if not v53 then
            warn("Unable to retrieve id verification feature, defaulting to false");
        end;
        return v54;
    end;
    v0.GetMeshTextureApisAllowed = function(v55, v56) --[[ Line: 134 ]] --[[ Name: GetMeshTextureApisAllowed ]]
        return v55:configurationV2GET(v56).responseBody.isMeshTextureApiAccessAllowed;
    end;
    v0.SetMeshTextureApisAllowed = function(v57, v58, v59) --[[ Line: 140 ]] --[[ Name: SetMeshTextureApisAllowed ]]
        return v57:configurationV2PATCH(v58, {
            isMeshTextureApiAccessAllowed = v59
        });
    end;
end;
return v0;
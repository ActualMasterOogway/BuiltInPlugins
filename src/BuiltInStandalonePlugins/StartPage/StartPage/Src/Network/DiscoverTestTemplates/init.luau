local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_collect_0 = v3.collect;
local l_collectArray_0 = v3.collectArray;
local l_map_0 = v3.map;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_Networking_0 = v9.Networking;
local l_StudioService_0 = v9.StudioService;
local v12 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local v13 = require(l_script_FirstAncestor_0.Src.Models.TestTemplateResponse);
local v14 = require(l_script_FirstAncestor_0.Src.Models.MultiGetPlaceDetailsResponse);
local v15 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local l_Url_0 = v2.RobloxAPI.Url;
local v17 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local v18 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local v19 = require(l_script_FirstAncestor_0.Src.Network.DiscoverPlaceholderIcons);
local v20 = v12(v13.validate);
local v21 = v12(v14.validate);
local v22 = {
    ["Content-Type"] = "application/json"
};
return function(_, v24, v25) --[[ Line: 47 ]] --[[ Name: DiscoverTestTemplates ]]
    -- upvalues: v15 (copy), l_StudioService_0 (copy), l_Url_0 (copy), v8 (copy), v17 (copy), v22 (copy), v20 (copy), l_collectArray_0 (copy), l_map_0 (copy), v21 (copy), l_collect_0 (copy), v18 (copy), v19 (copy)
    assert(v15 and l_StudioService_0:HasInternalPermission(), "Must enabled FFlagLuaStartPageStudioTestTemplates and have internal permission to use DiscoverTestTemplates");
    local v26 = l_Url_0.new();
    local v27 = v26.composeUrl(v8.TEST_TEMPLATES.Prefix, v8.TEST_TEMPLATES.Url());
    v17:parseJson(v17:get(v27, v22)):andThen(function(v28) --[[ Line: 55 ]]
        -- upvalues: v20 (ref), l_collectArray_0 (ref)
        local v29 = v20(v28);
        local v32 = l_collectArray_0(v29, function(_, v31) --[[ Line: 57 ]]
            return {
                Name = v31.name, 
                Description = v31.description, 
                RootPlaceId = tonumber(v31.url)
            };
        end);
        return {
            templates = v32, 
            targetResults = #v32
        };
    end):andThen(function(v33) --[[ Line: 70 ]]
        -- upvalues: l_map_0 (ref), v26 (copy), v8 (ref), v17 (ref), v22 (ref), v21 (ref), l_collect_0 (ref), l_collectArray_0 (ref), v18 (ref), v25 (copy), v24 (copy), v19 (ref)
        local l_templates_0 = v33.templates;
        local l_targetResults_0 = v33.targetResults;
        local v37 = l_map_0(l_templates_0, function(v36) --[[ Line: 73 ]]
            return v36.RootPlaceId;
        end);
        local v38 = "?";
        for v39, v40 in v37 do
            v38 = v38 .. string.format("placeIds=%s", v40);
            if v39 ~= #v37 then
                v38 = v38 .. "&";
            end;
        end;
        local v41 = v26.composeUrl(v8.MULTIGET_PLACES.Prefix, v8.MULTIGET_PLACES.Url()) .. v38;
        v17:parseJson(v17:get(v41, v22)):andThen(function(v42) --[[ Line: 86 ]]
            -- upvalues: v21 (ref), l_collect_0 (ref), l_collectArray_0 (ref), l_templates_0 (copy), v18 (ref), v25 (ref), v24 (ref), l_targetResults_0 (copy), v19 (ref)
            local v43 = v21(v42);
            local v46 = l_collect_0(v43, function(_, v45) --[[ Line: 88 ]]
                return v45.placeId, v45.universeId;
            end);
            local v49 = l_collectArray_0(v43, function(_, v48) --[[ Line: 91 ]]
                return v48.universeId;
            end);
            local v53 = l_collectArray_0(l_templates_0, function(_, v51) --[[ Line: 94 ]]
                -- upvalues: v46 (copy)
                local v52 = v46[v51.RootPlaceId];
                if not v52 then
                    return;
                else
                    return {
                        Id = v52, 
                        Name = v51.Name, 
                        RootPlaceId = v51.RootPlaceId, 
                        Description = v51.Description
                    };
                end;
            end);
            v18:setItemsForPage(v25, v24, v53);
            v18:setTargetCount(v25, l_targetResults_0);
            v19(v49, v25);
        end):catch(function(v54) --[[ Line: 110 ]]
            warn((("DiscoverTestTemplates failed: %*"):format(v54)));
        end);
    end);
end;
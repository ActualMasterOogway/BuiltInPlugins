local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v2 = require(l_Parent_0.Src.Util.FileUtils);
local l_Promise_0 = l_Util_0.Promise;
local l_Symbol_0 = l_Util_0.Symbol;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_CU1320ExperienceGenre_0 = game:GetFastFlag("CU1320ExperienceGenre");
local v8 = {};
v8.__index = v8;
v8.NameModerated = l_Symbol_0.named("NameModerated");
v8.DescriptionModerated = l_Symbol_0.named("DescriptionModerated");
v8.AltTextModerated = l_Symbol_0.named("AltTextModerated");
v8.new = function(v9) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        __networking = v9
    }, v8));
end;
v8.configurationV2GET = function(v10, v11) --[[ Line: 30 ]] --[[ Name: configurationV2GET ]]
    return v10.__networking:get("develop", "/v2/universes/" .. v11 .. "/configuration");
end;
v8.iconV1GET = function(v12, v13) --[[ Line: 36 ]] --[[ Name: iconV1GET ]]
    return v12.__networking:get("develop", "/v1/universes/" .. v13 .. "/icon");
end;
v8.thumbnailsV2GET = function(v14, v15) --[[ Line: 42 ]] --[[ Name: thumbnailsV2GET ]]
    return v14.__networking:get("games", "/v1/games/" .. v15 .. "/media");
end;
v8.configurationV2PATCH = function(v16, v17, v18) --[[ Line: 48 ]] --[[ Name: configurationV2PATCH ]]
    return v16.__networking:patch("develop", "/v2/universes/" .. v17 .. "/configuration", {
        Body = v18
    });
end;
v8.guidelinesPOST = function(v19, v20) --[[ Line: 56 ]] --[[ Name: guidelinesPOST ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    return v19.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-age-recommendation", {
        Body = {
            universeIds = {
                v20
            }
        }
    });
end;
v8.experienceGenreGET = function(v21, v22) --[[ Line: 67 ]] --[[ Name: experienceGenreGET ]]
    return v21.__networking:get("apis", "/experience-genre-api/v1/Creator/ExperienceGenre" .. "?universeId=" .. v22 .. "&genreTaxonomyVersion=1");
end;
v8.iconV1POST = function(v23, v24, v25) --[[ Line: 76 ]] --[[ Name: iconV1POST ]]
    -- upvalues: v2 (copy)
    local l___networking_0 = v23.__networking;
    local v27 = v2.GetAssetPublishRequestInfo(v25);
    v27.Method = nil;
    return l___networking_0:post("publish", "/v1/games/" .. v24 .. "/icon", v27);
end;
v8.thumbnailV1POST = function(v28, v29, v30) --[[ Line: 85 ]] --[[ Name: thumbnailV1POST ]]
    -- upvalues: v2 (copy)
    local l___networking_1 = v28.__networking;
    local v32 = v2.GetAssetPublishRequestInfo(v30);
    v32.Method = nil;
    return l___networking_1:post("publish", "/v1/games/" .. v29 .. "/thumbnail/image", v32);
end;
v8.thumbnailV1DELETE = function(v33, v34, v35) --[[ Line: 94 ]] --[[ Name: thumbnailV1DELETE ]]
    return v33.__networking:delete("develop", "/v1/universes/" .. v34 .. "/thumbnails/" .. v35);
end;
v8.thumbnailOrderV1POST = function(v36, v37, v38) --[[ Line: 100 ]] --[[ Name: thumbnailOrderV1POST ]]
    return v36.__networking:post("develop", "/v1/universes/" .. v37 .. "/thumbnails/order", {
        Body = {
            thumbnailIds = v38
        }
    });
end;
v8.thumbnailAltTextV1POST = function(v39, v40, v41) --[[ Line: 110 ]] --[[ Name: thumbnailAltTextV1POST ]]
    return v39.__networking:post("develop", "/v1/universes/" .. v40 .. "/thumbnails/alt-text", {
        Body = v41
    });
end;
v8.getName = function(v42, v43) --[[ Line: 118 ]] --[[ Name: getName ]]
    return v42:configurationV2GET(v43):await().responseBody.name;
end;
v8.setName = function(v44, v45, v46) --[[ Line: 123 ]] --[[ Name: setName ]]
    -- upvalues: v8 (copy), l_StudioPublishService_0 (copy)
    local v47 = nil;
    v44:configurationV2PATCH(v45, {
        name = v46
    }):catch(function(v48) --[[ Line: 126 ]]
        -- upvalues: v47 (ref), v8 (ref)
        if v48.responseCode == 400 then
            for _, v50 in ipairs(v48.responseBody.errors) do
                if v50.code == 7 then
                    v47 = v8.NameModerated;
                end;
            end;
        end;
    end):await();
    if v47 then
        error(v47);
    else
        l_StudioPublishService_0:SetUniverseDisplayName(v46);
    end;
end;
v8.getDescription = function(v51, v52) --[[ Line: 144 ]] --[[ Name: getDescription ]]
    return v51:configurationV2GET(v52):await().responseBody.description or "";
end;
v8.getGuidelines = function(v53, v54) --[[ Line: 149 ]] --[[ Name: getGuidelines ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    local v55 = v53:guidelinesPOST(v54):await().responseBody.ageRecommendationDetailsByUniverse[1];
    assert(v55);
    assert(v55.universeId == v54);
    if v55 then
        local l_ageRecommendation_0 = v55.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
        if l_ageRecommendation_0 then
            return l_ageRecommendation_0.displayName;
        end;
    end;
    return nil;
end;
v8.getExperienceGenre = function(v57, v58) --[[ Line: 165 ]] --[[ Name: getExperienceGenre ]]
    -- upvalues: l_CU1320ExperienceGenre_0 (copy)
    if not l_CU1320ExperienceGenre_0 then
        return nil;
    else
        local v60 = v57:experienceGenreGET(v58):catch(function(v59) --[[ Line: 171 ]]
            warn("GameInfoController:getExperienceGenre experienced an error: " .. tostring(v59));
            return nil;
        end):await();
        if v60 == nil then
            return nil;
        else
            return v60.responseBody and v60.responseBody.genre or nil;
        end;
    end;
end;
v8.setDescription = function(v61, v62, v63) --[[ Line: 184 ]] --[[ Name: setDescription ]]
    v61:configurationV2PATCH(v62, {
        description = v63
    }):await();
end;
v8.getGenre = function(v64, v65) --[[ Line: 188 ]] --[[ Name: getGenre ]]
    return v64:configurationV2GET(v65):await().responseBody.genre;
end;
v8.setGenre = function(v66, v67, v68) --[[ Line: 193 ]] --[[ Name: setGenre ]]
    v66:configurationV2PATCH(v67, {
        genre = v68
    }):await();
end;
v8.getSupportedDevices = function(v69, v70) --[[ Line: 197 ]] --[[ Name: getSupportedDevices ]]
    return v69:configurationV2GET(v70):await().responseBody.playableDevices;
end;
v8.setSupportedDevices = function(v71, v72, v73) --[[ Line: 204 ]] --[[ Name: setSupportedDevices ]]
    v71:configurationV2PATCH(v72, {
        playableDevices = v73
    }):await();
end;
v8.getThumbnails = function(v74, v75) --[[ Line: 208 ]] --[[ Name: getThumbnails ]]
    return v74:thumbnailsV2GET(v75):await().responseBody.data;
end;
v8.addThumbnails = function(v76, v77, v78) --[[ Line: 214 ]] --[[ Name: addThumbnails ]]
    -- upvalues: l_Promise_0 (copy)
    local v79 = {};
    local v80 = {};
    for _, v82 in ipairs(v78) do
        table.insert(v79, v76:thumbnailV1POST(v77, v82):andThen(function(v83) --[[ Line: 221 ]]
            -- upvalues: v80 (copy), v82 (copy)
            local l_targetId_0 = v83.responseBody.targetId;
            v80[v82] = l_targetId_0;
        end));
    end;
    l_Promise_0.all(v79):await();
    return v80;
end;
v8.removeThumbnails = function(v85, v86, v87) --[[ Line: 233 ]] --[[ Name: removeThumbnails ]]
    -- upvalues: l_Promise_0 (copy)
    local v88 = {};
    for _, v90 in ipairs(v87) do
        table.insert(v88, v85:thumbnailV1DELETE(v86, v90));
    end;
    l_Promise_0.all(v88):await();
end;
v8.updateThumbnailAltText = function(v91, v92, v93) --[[ Line: 242 ]] --[[ Name: updateThumbnailAltText ]]
    -- upvalues: v8 (copy)
    local v94 = nil;
    local v95 = nil;
    v91:thumbnailAltTextV1POST(v92, v93):andThen(function(v96) --[[ Line: 246 ]]
        -- upvalues: v94 (ref)
        v94 = v96.responseBody;
    end):catch(function(v97) --[[ Line: 249 ]]
        -- upvalues: v95 (ref), v8 (ref)
        if v97.responseCode == 400 then
            for _, v99 in ipairs(v97.responseBody.errors) do
                if v99.code == 19 then
                    v95 = v8.AltTextModerated;
                end;
            end;
        end;
    end):await();
    if v95 then
        error(v95);
    elseif v94 ~= nil then
        return v94;
    end;
    return nil;
end;
v8.setThumbnailsOrder = function(v100, v101, v102) --[[ Line: 269 ]] --[[ Name: setThumbnailsOrder ]]
    v100:thumbnailOrderV1POST(v101, v102):await();
end;
v8.getIcon = function(v103, v104) --[[ Line: 273 ]] --[[ Name: getIcon ]]
    local v105 = v103:iconV1GET(v104):await();
    local l_imageId_0 = v105.responseBody.imageId;
    local l_isApproved_0 = v105.responseBody.isApproved;
    return l_imageId_0 and "rbxassetid://" .. l_imageId_0 or nil, l_isApproved_0;
end;
v8.setIcon = function(v108, v109, v110) --[[ Line: 281 ]] --[[ Name: setIcon ]]
    v108:iconV1POST(v109, v110):await();
end;
v8.getOptInLocations = function(v111, v112) --[[ Line: 285 ]] --[[ Name: getOptInLocations ]]
    return v111:configurationV2GET(v112):await().responseBody.optInRegions;
end;
v8.setOptInLocations = function(v113, v114, v115, v116) --[[ Line: 290 ]] --[[ Name: setOptInLocations ]]
    v113:configurationV2PATCH(v114, {
        optInRegions = v115, 
        optOutRegions = v116
    });
end;
return v8;
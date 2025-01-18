local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Thunks.PostContactEmail);
local v3 = require(l_Parent_0.Src.Util.Analytics);
local v4 = require(l_Parent_0.Src.Util.KeyProvider).getOptInLocationsKeyName();
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local v6 = require(l_Parent_0.Src.Network.Requests.ApiSetUniverseDataSharing);
local v7 = require(l_Parent_0.Src.Flags.getFIntCAP1107ThrottleHundredthsPercentage);
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local v9 = require(l_Parent_0.Packages.Cryo);
local v10 = {
    isActive = true
};
local v11 = {
    description = true, 
    genre = true, 
    name = true, 
    playableDevices = true, 
    isFriendsOnly = true
};
if l_shouldShowDevPublishLocations_0() then
    v11.OptInLocations = true;
end;
local function _(v12) --[[ Line: 43 ]] --[[ Name: universeActivateAcceptsValue ]]
    -- upvalues: v10 (copy)
    return v10[v12] ~= nil;
end;
local function _(v14) --[[ Line: 47 ]] --[[ Name: configurationAcceptsValue ]]
    -- upvalues: v11 (copy)
    return v11[v14] ~= nil;
end;
local function v21(v16, v17) --[[ Line: 51 ]] --[[ Name: parseErrorMessages ]]
    local v18 = v17 .. " HTTP " .. v16.responseCode;
    warn(v18);
    for _, v20 in pairs(v16.responseBody.errors) do
        warn(v20.userFacingMessage);
    end;
end;
return {
    saveAll = function(v22, v23, v24, v25, v26, v27) --[[ Line: 66 ]] --[[ Name: saveAll ]]
        -- upvalues: v11 (copy), v10 (copy), l_StudioPublishService_0 (copy), l_shouldShowDevPublishLocations_0 (copy), v2 (copy), v4 (copy), v21 (copy), v9 (copy), v6 (copy), l_sendAnalyticsToKibana_0 (copy), v7 (copy), v3 (copy)
        local v28 = {};
        local v29 = {};
        for v30, v31 in pairs(v22) do
            if v11[v30] ~= nil then
                v28[v30] = v31;
            elseif v10[v30] ~= nil then
                v29[v30] = v31;
            end;
        end;
        game:GetService("StudioPublishService"):SetTeamCreateOnPublishInfo(v22.teamCreateEnabled, v28.name);
        l_StudioPublishService_0:setUploadNames(v28.name, v28.name);
        l_StudioPublishService_0:publishAs(0, 0, v22.creatorId, v26, nil);
        local v32 = nil;
        local v33 = nil;
        local v34, v35 = l_StudioPublishService_0.GamePublishFinished:wait();
        v32 = v34;
        v33 = v35;
        if not v32 then
            return;
        else
            if v28.playableDevices then
                v34 = {};
                for v36, v37 in pairs(v28.playableDevices) do
                    if v37 then
                        table.insert(v34, v36);
                    end;
                end;
                v28.playableDevices = v34;
            end;
            if l_shouldShowDevPublishLocations_0() and v25 ~= nil then
                if v2(v24, v25, v33) == 200 then
                    assert(v28.OptInLocations);
                    v35 = {};
                    local v38 = {};
                    for v39, v40 in pairs(v28.OptInLocations) do
                        if v40 then
                            table.insert(v35, v39);
                        else
                            table.insert(v38, v39);
                        end;
                    end;
                    v28.optInRegions = v35;
                    v28.optOutRegions = v38;
                else
                    warn(v23:getText(v4, "EmailSubmitFailure"));
                end;
                v28.OptInLocations = nil;
            end;
            v24.Develop.V2.Universes.configuration(v33, v28):makeRequest():andThen(function() --[[ Line: 124 ]]
                -- upvalues: l_StudioPublishService_0 (ref), v28 (copy)
                l_StudioPublishService_0:SetUniverseDisplayName(v28.name);
                l_StudioPublishService_0:RefreshDocumentDisplayName();
                l_StudioPublishService_0:EmitPlacePublishedSignal();
            end, function(v41) --[[ Line: 128 ]]
                -- upvalues: v21 (ref), v23 (copy)
                v21(v41, v23:getText("Error", "SetConfiguration"));
            end);
            if v29.isActive then
                v24.Develop.V1.Universes.activate(v33):makeRequest():catch(function(v42) --[[ Line: 133 ]]
                    -- upvalues: v21 (ref), v23 (copy)
                    v21(v42, v23:getText("Error", "ActivatingUniverse"));
                end);
            else
                v24.Develop.V1.Universes.deactivate(v33):makeRequest():catch(function(v43) --[[ Line: 137 ]]
                    -- upvalues: v21 (ref), v23 (copy)
                    v21(v43, v23:getText("Error", "DeactivatingUniverse"));
                end);
            end;
            assert(v27);
            v34 = true;
            if v22.creatorId ~= 0 then
                v34 = v9.List.find(v27, v22.creatorId) ~= nil;
            end;
            v35 = v34 and v22.dataSharingEnabled == true;
            if v35 then
                v6(v33);
            end;
            l_sendAnalyticsToKibana_0("PublishPlaceAsDataSharing", v7(), "saveAll", {
                dataSharingEnabled = v22.dataSharingEnabled, 
                dataSharingDefault = v22.dataSharingDefault, 
                isOwner = v34
            });
            local v44 = v22.creatorId ~= 0 and v22.creatorId or nil;
            v3.reportDataSharingToEventIngest(v22.dataSharingDefault, v35, v33, v44);
            return;
        end;
    end
};
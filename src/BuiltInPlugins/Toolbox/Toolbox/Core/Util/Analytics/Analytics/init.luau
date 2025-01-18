local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Dash);
local v3 = require(l_Parent_0.Core.Util.Analytics.Senders);
local v4 = require(l_Parent_0.Core.Util.Constants);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_Parent_0.Core.Util.getUserId);
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableWebView);
local v14 = require(l_Parent_0.Core.Flags.getFFlagEnableUGCIndividualAssetUploadAnalytics);
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixAnalyticCapitalization);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v17 = require(l_Parent_0.Core.Util.getPlaceId);
local function v19() --[[ Line: 32 ]] --[[ Name: getStudioSessionId ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local v18 = nil;
    pcall(function() --[[ Line: 34 ]]
        -- upvalues: v18 (ref), l_RbxAnalyticsService_0 (ref)
        v18 = l_RbxAnalyticsService_0:GetSessionId();
    end);
    return v18;
end;
local function v21() --[[ Line: 40 ]] --[[ Name: getClientId ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local v20 = nil;
    pcall(function() --[[ Line: 42 ]]
        -- upvalues: v20 (ref), l_RbxAnalyticsService_0 (ref)
        v20 = l_RbxAnalyticsService_0:GetClientId();
    end);
    return v20;
end;
local function v22() --[[ Line: 48 ]] --[[ Name: getPlatformId ]]
    return 0;
end;
local v23 = {};
local v24 = game:GetService("RunService"):IsEdit();
v23.getIsEditMode = function() --[[ Line: 55 ]]
    -- upvalues: v24 (copy)
    return v24;
end;
v23.getPlaceId = v17;
v23.getPlatformId = v22;
v23.getClientId = v21;
v23.getStudioSessionId = v19;
if v13() then
    v23.eventTarget = v4.ANALYTICS_TARGET.Studio;
    v23.setEventTarget = function(v25) --[[ Line: 68 ]] --[[ Name: setEventTarget ]]
        -- upvalues: v23 (copy)
        v23.eventTarget = v25;
    end;
end;
if v13() then
    v23.getWebViewTrackingAttributes = function(v26) --[[ Line: 74 ]] --[[ Name: getWebViewTrackingAttributes ]]
        -- upvalues: v2 (copy), v23 (copy), v7 (copy)
        return v2.join({
            clientId = v23.getClientId(), 
            isEditMode = v23.getIsEditMode(), 
            placeId = v23.getPlaceId(), 
            platformId = v23.getPlatformId(), 
            studioSid = v23.getStudioSessionId(), 
            userId = v7()
        }, v26);
    end;
end;
if v12() then
    v23.Status = {
        Start = "Start", 
        Success = "Success", 
        Failure = "Failure"
    };
end;
v23.onTermSearchedWithoutInsertion = function(v27, v28) --[[ Line: 95 ]] --[[ Name: onTermSearchedWithoutInsertion ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_0 = v3.sendEventImmediately;
    local v30 = if v13() then v23.eventTarget else "studio";
    local v31 = "toolbox";
    local v32 = "termSearchedWithoutInsertion";
    local v33 = {
        categoryName = v27, 
        searchTerm = v28
    };
    local v34 = nil;
    local v35;
    do
        local l_v34_0 = v34;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v34_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v34_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v35 = l_v34_0;
    end;
    v33.studioSid = v35;
    v34 = nil;
    do
        local l_v34_1 = v34;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v34_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v34_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v35 = l_v34_1;
    end;
    v33.clientId = v35;
    v33.userId = v7();
    v33.isEditMode = v24;
    l_sendEventImmediately_0(v30, v31, v32, v33);
end;
v23.onCreatorSearched = function(v38, v39, v40) --[[ Line: 111 ]] --[[ Name: onCreatorSearched ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v10 (copy), v24 (copy)
    local l_sendEventImmediately_1 = v3.sendEventImmediately;
    local v42 = if v13() then v23.eventTarget else "studio";
    local v43 = "toolbox";
    local v44 = "creatorSearched";
    local v45 = {
        searchTerm = v38, 
        creatorId = v39
    };
    local v46 = nil;
    local v47;
    do
        local l_v46_0 = v46;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v46_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v46_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v47 = l_v46_0;
    end;
    v45.studioSid = v47;
    v46 = nil;
    do
        local l_v46_1 = v46;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v46_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v46_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v47 = l_v46_1;
    end;
    v45.clientId = v47;
    v45.userId = v7();
    v45.type = if v10() then v40 else nil;
    v45.isEditMode = v24;
    l_sendEventImmediately_1(v42, v43, v44, v45);
end;
v23.onTryAsset = function(v50) --[[ Line: 128 ]] --[[ Name: onTryAsset ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_2 = v3.sendEventImmediately;
    local v52 = if v13() then v23.eventTarget else "studio";
    local v53 = "toolbox";
    local v54 = "tryAsset";
    local v55 = {
        assetId = v50
    };
    local v56 = nil;
    local v57;
    do
        local l_v56_0 = v56;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v56_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v56_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v57 = l_v56_0;
    end;
    v55.studioSid = v57;
    v56 = nil;
    do
        local l_v56_1 = v56;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v56_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v56_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v57 = l_v56_1;
    end;
    v55.clientId = v57;
    v55.userId = v7();
    v55.isEditMode = v24;
    l_sendEventImmediately_2(v52, v53, v54, v55);
end;
v23.onTryAssetFailure = function(v60) --[[ Line: 143 ]] --[[ Name: onTryAssetFailure ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_3 = v3.sendEventImmediately;
    local v62 = if v13() then v23.eventTarget else "studio";
    local v63 = "toolbox";
    local v64 = "tryAssetFailure";
    local v65 = {
        assetId = v60
    };
    local v66 = nil;
    local v67;
    do
        local l_v66_0 = v66;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v66_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v66_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v67 = l_v66_0;
    end;
    v65.studioSid = v67;
    v66 = nil;
    do
        local l_v66_1 = v66;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v66_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v66_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v67 = l_v66_1;
    end;
    v65.clientId = v67;
    v65.userId = v7();
    v65.isEditMode = v24;
    l_sendEventImmediately_3(v62, v63, v64, v65);
end;
v23.onSearchOptionsOpened = function() --[[ Line: 158 ]] --[[ Name: onSearchOptionsOpened ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_4 = v3.sendEventImmediately;
    local v71 = if v13() then v23.eventTarget else "studio";
    local v72 = "toolbox";
    local v73 = "searchOptionsOpened";
    local v74 = {};
    local v75 = nil;
    local v76;
    do
        local l_v75_0 = v75;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v75_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v75_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v76 = l_v75_0;
    end;
    v74.studioSid = v76;
    v75 = nil;
    do
        local l_v75_1 = v75;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v75_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v75_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v76 = l_v75_1;
    end;
    v74.clientId = v76;
    v74.userId = v7();
    v74.isEditMode = v24;
    l_sendEventImmediately_4(v71, v72, v73, v74);
end;
v23.onCategorySelected = function(v79, v80) --[[ Line: 172 ]] --[[ Name: onCategorySelected ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy)
    local l_sendEventImmediately_5 = v3.sendEventImmediately;
    local v82 = if v13() then v23.eventTarget else "studio";
    local v83 = "click";
    local v84 = "toolboxCategorySelection";
    local v85 = {
        oldCategory = v79, 
        newCategory = v80
    };
    local v86 = nil;
    local v87;
    do
        local l_v86_0 = v86;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v86_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v86_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v87 = l_v86_0;
    end;
    v85.studioSid = v87;
    v86 = nil;
    do
        local l_v86_1 = v86;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v86_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v86_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v87 = l_v86_1;
    end;
    v85.clientId = v87;
    v85.isEditMode = v24;
    l_sendEventImmediately_5(v82, v83, v84, v85);
end;
v23.onAssetInserted = function(v90, v91, v92, v93, v94) --[[ Line: 187 ]] --[[ Name: onAssetInserted ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy), v24 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v95 = {
        assetId = v90, 
        searchText = v91, 
        assetIndex = v92, 
        currentCategory = v93
    };
    local v96 = nil;
    local v97;
    do
        local l_v96_0 = v96;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v96_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v96_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v97 = l_v96_0;
    end;
    v95.studioSid = v97;
    v96 = nil;
    do
        local l_v96_1 = v96;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v96_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v96_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v97 = l_v96_1;
    end;
    v95.clientId = v97;
    v95.placeId = v17();
    v95.userId = v7();
    v95.isEditMode = v24;
    v95.layoutMode = v94;
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "click", "toolboxInsert", v95);
end;
v23.onAssetDragInserted = function(v100, v101, v102, v103) --[[ Line: 213 ]] --[[ Name: onAssetDragInserted ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_6 = v3.sendEventImmediately;
    local v105 = if v13() then v23.eventTarget else "studio";
    local v106 = "drag";
    local v107 = "toolboxInsert";
    local v108 = {
        assetId = v100, 
        searchText = v101, 
        assetIndex = v102, 
        currentCategory = v103
    };
    local v109 = nil;
    local v110;
    do
        local l_v109_0 = v109;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v109_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v109_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v110 = l_v109_0;
    end;
    v108.studioSid = v110;
    v109 = nil;
    do
        local l_v109_1 = v109;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v109_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v109_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v110 = l_v109_1;
    end;
    v108.clientId = v110;
    v108.placeId = v17();
    v108.userId = v7();
    v108.isEditMode = v24;
    l_sendEventImmediately_6(v105, v106, v107, v108);
end;
v23.reportDragInsertFinished = function(v113, v114) --[[ Line: 235 ]] --[[ Name: reportDragInsertFinished ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_7 = v3.sendEventImmediately;
    local v116 = if v13() then v23.eventTarget else "studio";
    local v117 = "Marketplace";
    local v118 = "DragInsertFinished";
    local v119 = {
        assetId = v113, 
        assetTypeId = v114
    };
    local v120 = nil;
    local v121;
    do
        local l_v120_0 = v120;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v120_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v120_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v121 = l_v120_0;
    end;
    v119.studioSid = v121;
    v120 = nil;
    do
        local l_v120_1 = v120;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v120_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v120_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v121 = l_v120_1;
    end;
    v119.clientId = v121;
    v119.placeId = v17();
    v119.userId = v7();
    v119.isEditMode = v24;
    l_sendEventImmediately_7(v116, v117, v118, v119);
end;
v23.onPackageNoteCreated = function(v124, v125, v126) --[[ Line: 252 ]] --[[ Name: onPackageNoteCreated ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy)
    local l_sendEventImmediately_8 = v3.sendEventImmediately;
    local v128 = if v13() then v23.eventTarget else "studio";
    local v129 = "AssetConfig";
    local v130 = "PackageNoteCreated";
    local v131 = {
        assetId = v124, 
        assetVersionNumber = v125, 
        message = v126
    };
    local v132 = nil;
    local v133;
    do
        local l_v132_0 = v132;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v132_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v132_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v133 = l_v132_0;
    end;
    v131.studioSid = v133;
    v132 = nil;
    do
        local l_v132_1 = v132;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v132_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v132_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v133 = l_v132_1;
    end;
    v131.clientId = v133;
    v131.placeId = v17();
    v131.userId = v7();
    l_sendEventImmediately_8(v128, v129, v130, v131);
end;
v23.onPackageNoteDiscarded = function(v136, v137, v138) --[[ Line: 269 ]] --[[ Name: onPackageNoteDiscarded ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy)
    local l_sendEventImmediately_9 = v3.sendEventImmediately;
    local v140 = if v13() then v23.eventTarget else "studio";
    local v141 = "AssetConfig";
    local v142 = "PackageNoteDiscarded";
    local v143 = {
        assetId = v136, 
        assetVersionNumber = v137, 
        message = v138
    };
    local v144 = nil;
    local v145;
    do
        local l_v144_0 = v144;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v144_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v144_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v145 = l_v144_0;
    end;
    v143.studioSid = v145;
    v144 = nil;
    do
        local l_v144_1 = v144;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v144_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v144_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v145 = l_v144_1;
    end;
    v143.clientId = v145;
    v143.placeId = v17();
    v143.userId = v7();
    l_sendEventImmediately_9(v140, v141, v142, v143);
end;
v23.onPackageNoteCanceled = function(v148) --[[ Line: 286 ]] --[[ Name: onPackageNoteCanceled ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v17 (copy), v7 (copy)
    local l_sendEventImmediately_10 = v3.sendEventImmediately;
    local v150 = if v13() then v23.eventTarget else "studio";
    local v151 = "AssetConfig";
    local v152 = "PackageNoteCanceled";
    local v153 = {
        assetId = v148
    };
    local v154 = nil;
    local v155;
    do
        local l_v154_0 = v154;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v154_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v154_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v155 = l_v154_0;
    end;
    v153.studioSid = v155;
    v154 = nil;
    do
        local l_v154_1 = v154;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v154_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v154_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v155 = l_v154_1;
    end;
    v153.clientId = v155;
    v153.placeId = v17();
    v153.userId = v7();
    l_sendEventImmediately_10(v150, v151, v152, v153);
end;
v23.incrementToolboxInsertCounter = function(v158) --[[ Line: 301 ]] --[[ Name: incrementToolboxInsertCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter(("Studio.ToolboxInsert.%s"):format((tostring(v158))));
end;
v23.incrementToolboxCategoryInsertCounter = function(v159) --[[ Line: 305 ]] --[[ Name: incrementToolboxCategoryInsertCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter(("Studio.ToolboxCategoryInsert.%s"):format((tostring(v159))));
end;
v23.incrementWorkspaceInsertCounter = function() --[[ Line: 309 ]] --[[ Name: incrementWorkspaceInsertCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter("StudioWorkspaceInsertCounter");
end;
v23.incrementUploadAssetSuccess = function(v160) --[[ Line: 313 ]] --[[ Name: incrementUploadAssetSuccess ]]
    -- upvalues: v3 (copy)
    v3.reportCounter(("Studio.Upload.%s.Success"):format((tostring(v160))));
end;
v23.incrementUploadAssetFailure = function(v161) --[[ Line: 317 ]] --[[ Name: incrementUploadAssetFailure ]]
    -- upvalues: v3 (copy)
    v3.reportCounter(("Studio.Upload.%s.Failure"):format((tostring(v161))));
end;
v23.onSoundPlayedCounter = function() --[[ Line: 321 ]] --[[ Name: onSoundPlayedCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter("Studio.ToolboxAudio.Played");
end;
v23.onSoundPausedCounter = function() --[[ Line: 325 ]] --[[ Name: onSoundPausedCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter("Studio.ToolboxAudio.Paused");
end;
v23.sendResultToKibana = function(v162) --[[ Line: 329 ]] --[[ Name: sendResultToKibana ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), v3 (copy)
    assert(l_NewPackageAnalyticsWithRefactor2_0);
    v3.sendResultToKibana(v162);
end;
v23.incrementAssetImpressionCounter = function() --[[ Line: 334 ]] --[[ Name: incrementAssetImpressionCounter ]]
    -- upvalues: v3 (copy)
    v3.reportCounter("Studio.ToolboxAsset.Impression");
end;
v23.onAssetPreviewSelected = function(v163) --[[ Line: 339 ]] --[[ Name: onAssetPreviewSelected ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventDeferred_0 = v3.sendEventDeferred;
    local v165 = if v13() then v23.eventTarget else "studio";
    local v166 = "toolbox";
    local v167 = "assetPreviewOpen";
    local v168 = {
        assetId = v163
    };
    local v169 = nil;
    local v170;
    do
        local l_v169_0 = v169;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v169_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v169_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v170 = l_v169_0;
    end;
    v168.clientId = v170;
    v168.userId = v7();
    v168.platformId = 0;
    v168.isEditMode = v24;
    l_sendEventDeferred_0(v165, v166, v167, v168);
end;
v23.onAssetPreviewEnded = function(v172, v173) --[[ Line: 355 ]] --[[ Name: onAssetPreviewEnded ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventDeferred_1 = v3.sendEventDeferred;
    local v175 = if v13() then v23.eventTarget else "studio";
    local v176 = "toolbox";
    local v177 = "modelPreviewInteractionDuration";
    local v178 = {
        assetId = v172, 
        time = v173
    };
    local v179 = nil;
    local v180;
    do
        local l_v179_0 = v179;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v179_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v179_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v180 = l_v179_0;
    end;
    v178.clientId = v180;
    v178.userId = v7();
    v178.platformId = 0;
    v178.isEditMode = v24;
    l_sendEventDeferred_1(v175, v176, v177, v178);
end;
v23.onAssetInsertedFromAssetPreview = function(v182) --[[ Line: 371 ]] --[[ Name: onAssetInsertedFromAssetPreview ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventDeferred_2 = v3.sendEventDeferred;
    local v184 = if v13() then v23.eventTarget else "studio";
    local v185 = "toolbox";
    local v186 = "previewInsertion";
    local v187 = {
        assetId = v182
    };
    local v188 = nil;
    local v189;
    do
        local l_v188_0 = v188;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v188_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v188_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v189 = l_v188_0;
    end;
    v187.clientId = v189;
    v187.userId = v7();
    v187.platformId = 0;
    v187.isEditMode = v24;
    l_sendEventDeferred_2(v184, v185, v186, v187);
end;
v23.onPluginButtonClickOpen = function() --[[ Line: 386 ]] --[[ Name: onPluginButtonClickOpen ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), v7 (copy), v17 (copy), v24 (copy)
    v3.sendEventDeferred(if v13() then v23.eventTarget else "studio", "toolbox", "MarketplaceOpen", {
        userId = v7(), 
        placeId = v17(), 
        isEditMode = v24
    });
end;
v23.onPluginButtonClickClose = function() --[[ Line: 399 ]] --[[ Name: onPluginButtonClickClose ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), v7 (copy), v17 (copy), v24 (copy)
    v3.sendEventDeferred(if v13() then v23.eventTarget else "studio", "toolbox", "MarketplaceClosed", {
        userId = v7(), 
        placeId = v17(), 
        isEditMode = v24
    });
end;
v23.onToolboxDisplayed = function() --[[ Line: 412 ]] --[[ Name: onToolboxDisplayed ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), v7 (copy), v17 (copy), v24 (copy)
    v3.sendEventDeferred(if v13() then v23.eventTarget else "studio", "toolbox", "MarketplaceImpression", {
        userId = v7(), 
        placeId = v17(), 
        isEditMode = v24
    });
end;
v23.onToolboxHidden = function() --[[ Line: 425 ]] --[[ Name: onToolboxHidden ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), v7 (copy), v17 (copy), v24 (copy)
    v3.sendEventDeferred(if v13() then v23.eventTarget else "studio", "Marketplace", "MarketplaceHidden", {
        userId = v7(), 
        placeId = v17(), 
        isEditMode = v24
    });
end;
v23.onContextMenuClicked = function(v191, v192, v193, v194) --[[ Line: 438 ]] --[[ Name: onContextMenuClicked ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_11 = v3.sendEventImmediately;
    local v196 = if v13() then v23.eventTarget else "studio";
    local v197 = "Marketplace";
    local l_v191_0 = v191;
    local v199 = {
        assetId = v192, 
        assetTypeId = v193
    };
    local v200 = nil;
    local v201;
    do
        local l_v200_0 = v200;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v200_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v200_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v201 = l_v200_0;
    end;
    v199.clientId = v201;
    v199.userId = v7();
    v199.platformId = 0;
    v200 = nil;
    do
        local l_v200_1 = v200;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v200_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v200_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v201 = l_v200_1;
    end;
    v199.studioSid = v201;
    v199.isEditMode = v24;
    v199.currentCategory = v194;
    l_sendEventImmediately_11(v196, v197, l_v191_0, v199);
end;
v23.openedFromPluginManagement = function() --[[ Line: 456 ]] --[[ Name: openedFromPluginManagement ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy)
    local l_sendEventImmediately_12 = v3.sendEventImmediately;
    local v205 = if v13() then v23.eventTarget else "studio";
    local v206 = "Marketplace";
    local v207 = "OpenedFromPluginManagement";
    local v208 = {};
    local v209 = nil;
    local v210;
    do
        local l_v209_0 = v209;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v209_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v209_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v210 = l_v209_0;
    end;
    v208.studioSid = v210;
    v209 = nil;
    do
        local l_v209_1 = v209;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v209_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v209_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v210 = l_v209_1;
    end;
    v208.clientId = v210;
    v208.isEditMode = v24;
    l_sendEventImmediately_12(v205, v206, v207, v208);
end;
v23.openedExternallyByAssetType = function(v213) --[[ Line: 469 ]] --[[ Name: openedExternallyByAssetType ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy)
    local l_sendEventImmediately_13 = v3.sendEventImmediately;
    local v215 = if v13() then v23.eventTarget else "studio";
    local v216 = "Marketplace";
    local v217 = "OpenedExternallyByAssetType";
    local v218 = {
        assetTypeName = v213
    };
    local v219 = nil;
    local v220;
    do
        local l_v219_0 = v219;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v219_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v219_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v220 = l_v219_0;
    end;
    v218.clientId = v220;
    v218.isEditMode = v24;
    v219 = nil;
    do
        local l_v219_1 = v219;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v219_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v219_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v220 = l_v219_1;
    end;
    v218.studioSid = v220;
    l_sendEventImmediately_13(v215, v216, v217, v218);
end;
v23.reportAssetClicked = function(v223, v224) --[[ Line: 483 ]] --[[ Name: reportAssetClicked ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy)
    local l_sendEventImmediately_14 = v3.sendEventImmediately;
    local v226 = if v13() then v23.eventTarget else "studio";
    local v227 = "Marketplace";
    local v228 = "ReportAssetClicked";
    local v229 = {};
    local v230 = nil;
    local v231;
    do
        local l_v230_0 = v230;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v230_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v230_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v231 = l_v230_0;
    end;
    v229.studioSid = v231;
    v230 = nil;
    do
        local l_v230_1 = v230;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v230_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v230_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v231 = l_v230_1;
    end;
    v229.clientId = v231;
    v229.isEditMode = v24;
    v229.assetId = v223;
    v229.assetTypeId = v224;
    l_sendEventImmediately_14(v226, v227, v228, v229);
end;
v23.reportMeshPartFiltered = function(v234) --[[ Line: 498 ]] --[[ Name: reportMeshPartFiltered ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy), v17 (copy)
    local l_sendEventImmediately_15 = v3.sendEventImmediately;
    local v236 = if v13() then v23.eventTarget else "studio";
    local v237 = "Marketplace";
    local v238 = "MeshPartFiltered";
    local v239 = {};
    local v240 = nil;
    local v241;
    do
        local l_v240_0 = v240;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v240_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v240_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v241 = l_v240_0;
    end;
    v239.studioSid = v241;
    v240 = nil;
    do
        local l_v240_1 = v240;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v240_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v240_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v241 = l_v240_1;
    end;
    v239.clientId = v241;
    v239.isEditMode = v24;
    v239.placeId = v17();
    v239.assetId = v234;
    l_sendEventImmediately_15(v236, v237, v238, v239);
end;
v23.onIdVerificationIconClicked = function(v244) --[[ Line: 513 ]] --[[ Name: onIdVerificationIconClicked ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_16 = v3.sendEventImmediately;
    local v246 = if v13() then v23.eventTarget else "studio";
    local v247 = "Marketplace";
    local v248 = "IdVerificationIconClicked";
    local v249 = {
        assetId = v244
    };
    local v250 = nil;
    local v251;
    do
        local l_v250_0 = v250;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v250_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v250_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v251 = l_v250_0;
    end;
    v249.clientId = v251;
    v249.userId = v7();
    v249.platformId = 0;
    v250 = nil;
    do
        local l_v250_1 = v250;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v250_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v250_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v251 = l_v250_1;
    end;
    v249.studioSid = v251;
    v249.isEditMode = v24;
    l_sendEventImmediately_16(v246, v247, v248, v249);
end;
v23.marketplaceSearch = function(v254, v255, v256) --[[ Line: 529 ]] --[[ Name: marketplaceSearch ]]
    -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (copy), v11 (copy), v24 (copy), v7 (copy), v17 (copy), v9 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v257;
    if v15() then
        v257 = {};
        local v258 = nil;
        local v259;
        do
            local l_v258_0 = v258;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v258_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v258_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v259 = l_v258_0;
        end;
        v257.studioSid = v259;
        v258 = nil;
        do
            local l_v258_1 = v258;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v258_1 (ref), l_RbxAnalyticsService_0 (ref)
                l_v258_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v259 = l_v258_1;
        end;
        v257.clientId = v259;
        v257.creatorIds = if v11() then v256.creatorIDs else nil;
        v257.excludeGroupCreations = if v11() then v256.excludeGroupCreations else nil;
        v257.groupIds = if v11() then v256.groupIDs else nil;
        v257.isEditMode = v24;
        v257.userId = v7();
        v257.ptid = 0;
        v257.placeId = v17();
        v257.searchKeyword = v254;
        v257.isTopKeyword = v255;
        v257.categoryName = v256.categoryName;
        v257.includeOnlyVerifiedCreators = v256.includeOnlyVerifiedCreators;
        v257.assetType = v256.assetType;
        v257.searchByCreatorId = if v11() then nil else v256.creatorID;
        v257.searchId = v256.searchId;
        v257.sort = v256.sort;
        v257.toolboxTab = v256.toolboxTab;
    else
        v257 = {};
        local v262 = nil;
        local v263;
        do
            local l_v262_0 = v262;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v262_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v262_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v263 = l_v262_0;
        end;
        v257.studioSid = v263;
        v262 = nil;
        do
            local l_v262_1 = v262;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v262_1 (ref), l_RbxAnalyticsService_0 (ref)
                l_v262_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v263 = l_v262_1;
        end;
        v257.clientID = v263;
        v257.creatorIDs = if v11() then v256.creatorIDs else nil;
        v257.excludeGroupCreations = if v11() then v256.excludeGroupCreations else nil;
        v257.groupIDs = if v11() then v256.groupIDs else nil;
        v257.isEditMode = v24;
        v257.userID = v7();
        v257.ptid = 0;
        v257.placeID = v17();
        v257.searchKeyword = v254;
        v257.isTopKeyword = v255;
        v257.categoryName = v256.categoryName;
        v257.includeOnlyVerifiedCreators = v256.includeOnlyVerifiedCreators;
        v257.assetType = v256.assetType;
        v257.searchByCreatorID = if v11() then nil else v256.creatorID;
        v257.searchID = v256.searchId;
        v257.sort = v256.sort;
        v257.toolboxTab = v256.toolboxTab;
    end;
    if v256.qualityFilterTags and v256.qualityFilterTags ~= "" then
        v257.qualityFilterTags = v256.qualityFilterTags;
    end;
    if v9() then
        v257.previousSearchId = v256.previousSearchId;
        v257.querySource = v256.querySource;
        v257.originalUserQuery = v256.originalUserQuery;
        v257.originalCorrection = v256.originalCorrection;
    end;
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "MarketplaceSearch", v257);
end;
v23.marketplaceAutocompleteSearch = function(v266, v267, v268, v269, v270, v271) --[[ Line: 601 ]] --[[ Name: marketplaceAutocompleteSearch ]]
    -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (copy), v24 (copy), v7 (copy), v17 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v272;
    if v15() then
        v272 = {};
        local v273 = nil;
        local v274;
        do
            local l_v273_0 = v273;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v273_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v273_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v274 = l_v273_0;
        end;
        v272.studioSid = v274;
        v273 = nil;
        do
            local l_v273_1 = v273;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v273_1 (ref), l_RbxAnalyticsService_0 (ref)
                l_v273_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v274 = l_v273_1;
        end;
        v272.clientId = v274;
        v272.isEditMode = v24;
        v272.userId = v7();
        v272.ptid = 0;
        v272.placeId = v17();
        v272.searchKeyword = v266;
        v272.autocompletePrefix = v267;
        v272.autocompleteKeyCount = v268;
        v272.autocompleteDeleteCount = v269;
        v272.autocompleteShown = v270;
        v272.assetType = v271.assetType;
        v272.searchByCreatorId = v271.creatorID;
        v272.searchId = v271.searchId;
        v272.sort = v271.sort;
        v272.toolboxTab = v271.toolboxTab;
    else
        v272 = {};
        local v277 = nil;
        local v278;
        do
            local l_v277_0 = v277;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v277_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v277_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v278 = l_v277_0;
        end;
        v272.studioSid = v278;
        v277 = nil;
        do
            local l_v277_1 = v277;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v277_1 (ref), l_RbxAnalyticsService_0 (ref)
                l_v277_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v278 = l_v277_1;
        end;
        v272.clientID = v278;
        v272.isEditMode = v24;
        v272.userID = v7();
        v272.ptid = 0;
        v272.placeID = v17();
        v272.searchKeyword = v266;
        v272.autocompletePrefix = v267;
        v272.autocompleteKeyCount = v268;
        v272.autocompleteDeleteCount = v269;
        v272.autocompleteShown = v270;
        v272.assetType = v271.assetType;
        v272.searchByCreatorID = v271.creatorID;
        v272.searchID = v271.searchId;
        v272.sort = v271.sort;
        v272.toolboxTab = v271.toolboxTab;
    end;
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "MarketplaceAutocompleteSearch", v272);
end;
v23.onToolboxWidgetInteraction = function(v281) --[[ Line: 659 ]] --[[ Name: onToolboxWidgetInteraction ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), v24 (copy)
    local l_sendEventImmediately_17 = v3.sendEventImmediately;
    local v283 = if v13() then v23.eventTarget else "studio";
    local v284 = "Marketplace";
    local v285 = "ToolboxWidgetInteraction";
    local v286 = {};
    local v287 = nil;
    local v288;
    do
        local l_v287_0 = v287;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v287_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v287_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v288 = l_v287_0;
    end;
    v286.clientId = v288;
    v286.userId = v7();
    v286.platformId = 0;
    v287 = nil;
    do
        local l_v287_1 = v287;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v287_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v287_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v288 = l_v287_1;
    end;
    v286.studioSid = v288;
    v286.isEditMode = v24;
    v286.widgetWidth = v281.X;
    v286.widgetHeight = v281.Y;
    l_sendEventImmediately_17(v283, v284, v285, v286);
end;
v23.AnnouncementViewed = function(v291, v292, v293, v294, v295, v296) --[[ Line: 676 ]] --[[ Name: AnnouncementViewed ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v7 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v297 = {
        announcementButtonKey = v291, 
        announcementDateKey = v292, 
        announcementDescriptionKey = v293, 
        announcementHeaderKey = v294, 
        announcementLinkKey = v295, 
        announcementLinkLocation = v296
    };
    local v298 = nil;
    local v299;
    do
        local l_v298_0 = v298;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v298_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v298_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v299 = l_v298_0;
    end;
    v297.clientId = v299;
    v297.platformId = 0;
    v298 = nil;
    do
        local l_v298_1 = v298;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v298_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v298_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v299 = l_v298_1;
    end;
    v297.studioSid = v299;
    v297.userId = v7();
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "AnnouncementViewed", v297);
end;
v23.AnnouncementLinkClicked = function(v302, v303, v304, v305, v306, v307) --[[ Line: 704 ]] --[[ Name: AnnouncementLinkClicked ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v7 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v308 = {
        announcementButtonKey = v302, 
        announcementDateKey = v303, 
        announcementDescriptionKey = v304, 
        announcementHeaderKey = v305, 
        announcementLinkKey = v306, 
        announcementLinkLocation = v307
    };
    local v309 = nil;
    local v310;
    do
        local l_v309_0 = v309;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v309_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v309_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v310 = l_v309_0;
    end;
    v308.clientId = v310;
    v308.platformId = 0;
    v309 = nil;
    do
        local l_v309_1 = v309;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v309_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v309_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v310 = l_v309_1;
    end;
    v308.studioSid = v310;
    v308.userId = v7();
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "AnnouncementLinkClicked", v308);
end;
v23.AnnouncementClosed = function(v313, v314, v315, v316, v317, v318, v319) --[[ Line: 732 ]] --[[ Name: AnnouncementClosed ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v7 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v320 = {
        announcementButtonKey = v313, 
        announcementDateKey = v314, 
        announcementDescriptionKey = v315, 
        announcementHeaderKey = v316, 
        announcementLinkKey = v317, 
        announcementLinkLocation = v318, 
        durationBeforeClosed = v319
    };
    local v321 = nil;
    local v322;
    do
        local l_v321_0 = v321;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v321_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v321_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v322 = l_v321_0;
    end;
    v320.clientId = v322;
    v320.platformId = 0;
    v321 = nil;
    do
        local l_v321_1 = v321;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v321_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v321_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v322 = l_v321_1;
    end;
    v320.studioSid = v322;
    v320.userId = v7();
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "AnnouncementClosed", v320);
end;
v23.AnnouncementAcknowledged = function(v325, v326, v327, v328, v329, v330, v331) --[[ Line: 762 ]] --[[ Name: AnnouncementAcknowledged ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v7 (copy), v3 (copy), v13 (copy), v23 (copy)
    local v332 = {
        announcementButtonKey = v325, 
        announcementDateKey = v326, 
        announcementDescriptionKey = v327, 
        announcementHeaderKey = v328, 
        announcementLinkKey = v329, 
        announcementLinkLocation = v330, 
        durationBeforeClosed = v331
    };
    local v333 = nil;
    local v334;
    do
        local l_v333_0 = v333;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v333_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v333_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v334 = l_v333_0;
    end;
    v332.clientId = v334;
    v332.platformId = 0;
    v333 = nil;
    do
        local l_v333_1 = v333;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v333_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v333_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v334 = l_v333_1;
    end;
    v332.studioSid = v334;
    v332.userId = v7();
    v3.sendEventImmediately(if v13() then v23.eventTarget else "studio", "Marketplace", "AnnouncementAcknowledged", v332);
end;
v23.AssetMediaItemsUpdated = function(v337, v338, v339) --[[ Line: 792 ]] --[[ Name: AssetMediaItemsUpdated ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy)
    local l_sendEventDeferred_3 = v3.sendEventDeferred;
    local v341 = if v13() then v23.eventTarget else "studio";
    local v342 = "Marketplace";
    local v343 = "AssetMediaItemsUpdated";
    local v344 = {
        assetId = v337, 
        assetMediaIds = table.concat(v339, ","), 
        assetTypeId = v338
    };
    local v345 = nil;
    local v346;
    do
        local l_v345_0 = v345;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v345_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v345_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v346 = l_v345_0;
    end;
    v344.clientId = v346;
    v344.platformId = 0;
    v345 = nil;
    do
        local l_v345_1 = v345;
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_v345_1 (ref), l_RbxAnalyticsService_0 (ref)
            l_v345_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v346 = l_v345_1;
    end;
    v344.studioSid = v346;
    v344.userId = v7();
    l_sendEventDeferred_3(v341, v342, v343, v344);
end;
v23.MarketplaceListViewToggleClicked = function(v349, v350) --[[ Line: 809 ]] --[[ Name: MarketplaceListViewToggleClicked ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy)
    local l_sendEventDeferred_4 = v3.sendEventDeferred;
    local v352 = if v13() then v23.eventTarget else "studio";
    local v353 = "Marketplace";
    local v354 = "MarketplaceListViewToggleClicked";
    local v355 = {
        assetType = v350.assetType, 
        layoutMode = v349, 
        searchId = v350.searchId
    };
    local v356 = nil;
    local v357;
    do
        local l_v356_0 = v356;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v356_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v356_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v357 = l_v356_0;
    end;
    v355.clientId = v357;
    v355.userId = v7();
    l_sendEventDeferred_4(v352, v353, v354, v355);
end;
v23.MarketplaceAssetRowExpanded = function(v359, v360, v361, v362) --[[ Line: 824 ]] --[[ Name: MarketplaceAssetRowExpanded ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy)
    local l_sendEventDeferred_5 = v3.sendEventDeferred;
    local v364 = if v13() then v23.eventTarget else "studio";
    local v365 = "Marketplace";
    local v366 = "MarketplaceAssetRowExpanded";
    local v367 = {
        assetId = v359, 
        assetType = v362.assetType, 
        pageNumber = v360, 
        pagePosition = v361, 
        searchId = v362.searchId
    };
    local v368 = nil;
    local v369;
    do
        local l_v368_0 = v368;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v368_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v368_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v369 = l_v368_0;
    end;
    v367.clientId = v369;
    v367.platformId = 0;
    v367.userId = v7();
    l_sendEventDeferred_5(v364, v365, v366, v367);
end;
v23.MarketplaceRecentSearchClicked = function(v371) --[[ Line: 847 ]] --[[ Name: MarketplaceRecentSearchClicked ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy)
    local l_sendEventDeferred_6 = v3.sendEventDeferred;
    local v373 = if v13() then v23.eventTarget else "studio";
    local v374 = "Marketplace";
    local v375 = "MarketplaceRecentSearchClicked";
    local v376 = {
        keyword = v371
    };
    local v377 = nil;
    local v378;
    do
        local l_v377_0 = v377;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v377_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v377_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v378 = l_v377_0;
    end;
    v376.clientId = v378;
    v376.userId = v7();
    l_sendEventDeferred_6(v373, v374, v375, v376);
end;
v23.MarketplaceSearchFilterOpened = function(v380, v381) --[[ Line: 860 ]] --[[ Name: MarketplaceSearchFilterOpened ]]
    -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy)
    local l_sendEventDeferred_7 = v3.sendEventDeferred;
    local v383 = if v13() then v23.eventTarget else "studio";
    local v384 = "Marketplace";
    local v385 = "MarketplaceSearchFilterOpened";
    local v386 = {
        assetTypeId = if v380 then v380.Value else nil
    };
    local v387 = nil;
    local v388;
    do
        local l_v387_0 = v387;
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_v387_0 (ref), l_RbxAnalyticsService_0 (ref)
            l_v387_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v388 = l_v387_0;
    end;
    v386.clientId = v388;
    v386.toolboxTab = v381;
    v386.userId = v7();
    l_sendEventDeferred_7(v383, v384, v385, v386);
end;
if v12() then
    v23.UGCBundleValidationEvent = function(v390, v391, v392) --[[ Line: 875 ]] --[[ Name: UGCBundleValidationEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_8 = v3.sendEventDeferred;
        local v394 = if v13() then v23.eventTarget else "studio";
        local v395 = "UGCUploadFlow";
        local v396 = "UGCBundleValidationEvent";
        local v397 = {};
        local v398 = nil;
        local v399;
        do
            local l_v398_0 = v398;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v398_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v398_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v399 = l_v398_0;
        end;
        v397.clientId = v399;
        v397.status = v390;
        v397.bundleType = v391;
        v397.errors = v392;
        l_sendEventDeferred_8(v394, v395, v396, v397);
    end;
    v23.UGCUploadRequestOperationIdEvent = function(v401, v402, v403, v404) --[[ Line: 889 ]] --[[ Name: UGCUploadRequestOperationIdEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_9 = v3.sendEventDeferred;
        local v406 = if v13() then v23.eventTarget else "studio";
        local v407 = "UGCUploadFlow";
        local v408 = "UGCUploadRequestOperationIdEvent";
        local v409 = {};
        local v410 = nil;
        local v411;
        do
            local l_v410_0 = v410;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v410_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v410_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v411 = l_v410_0;
        end;
        v409.clientId = v411;
        v409.status = v401;
        v409.bundleType = v402;
        v409.operationId = v403;
        v409.errors = v404;
        l_sendEventDeferred_9(v406, v407, v408, v409);
    end;
    v23.UGCUploadAssetsEvent = function(v413, v414, v415, v416, v417) --[[ Line: 909 ]] --[[ Name: UGCUploadAssetsEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_10 = v3.sendEventDeferred;
        local v419 = if v13() then v23.eventTarget else "studio";
        local v420 = "UGCUploadFlow";
        local v421 = "UGCUploadAssetsEvent";
        local v422 = {};
        local v423 = nil;
        local v424;
        do
            local l_v423_0 = v423;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v423_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v423_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v424 = l_v423_0;
        end;
        v422.clientId = v424;
        v422.status = v413;
        v422.bundleType = v414;
        v422.operationId = v415;
        v422.assetIds = v416;
        v422.errors = v417;
        l_sendEventDeferred_10(v419, v420, v421, v422);
    end;
    v23.UGCIndividualAssetUploadEvent = function(v426, v427) --[[ Line: 931 ]] --[[ Name: UGCIndividualAssetUploadEvent ]]
        -- upvalues: v14 (copy), v3 (copy), v13 (copy), v23 (copy), v17 (copy), l_RbxAnalyticsService_0 (copy)
        assert(v14(), "not enabled yet");
        local l_sendEventDeferred_11 = v3.sendEventDeferred;
        local v429 = if v13() then v23.eventTarget else "studio";
        local v430 = "UGCUploadFlow";
        local v431 = "UGCIndividualAssetUploadEvent";
        local v432 = {
            placeId = v17()
        };
        local v433 = nil;
        local v434;
        do
            local l_v433_0 = v433;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v433_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v433_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v434 = l_v433_0;
        end;
        v432.studioSid = v434;
        v433 = nil;
        do
            local l_v433_1 = v433;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v433_1 (ref), l_RbxAnalyticsService_0 (ref)
                l_v433_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v434 = l_v433_1;
        end;
        v432.clientId = v434;
        v432.assetId = v426;
        v432.underlyingAssetIds = v427;
        l_sendEventDeferred_11(v429, v430, v431, v432);
    end;
    v23.UGCUploadRequestBundleCreationStatusEvent = function(v437, v438, v439, v440, v441, v442) --[[ Line: 947 ]] --[[ Name: UGCUploadRequestBundleCreationStatusEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_12 = v3.sendEventDeferred;
        local v444 = if v13() then v23.eventTarget else "studio";
        local v445 = "UGCUploadFlow";
        local v446 = "UGCUploadRequestBundleCreationStatusEvent";
        local v447 = {};
        local v448 = nil;
        local v449;
        do
            local l_v448_0 = v448;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v448_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v448_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v449 = l_v448_0;
        end;
        v447.clientId = v449;
        v447.status = v437;
        v447.bundleType = v438;
        v447.operationId = v439;
        v447.assetIds = v440;
        v447.creationStatusId = v441;
        v447.errors = v442;
        l_sendEventDeferred_12(v444, v445, v446, v447);
    end;
    v23.UGCUploadGetBundleCreationStatusEvent = function(v451, v452, v453, v454, v455, v456, v457) --[[ Line: 971 ]] --[[ Name: UGCUploadGetBundleCreationStatusEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_13 = v3.sendEventDeferred;
        local v459 = if v13() then v23.eventTarget else "studio";
        local v460 = "UGCUploadFlow";
        local v461 = "UGCUploadGetBundleCreationStatusEvent";
        local v462 = {};
        local v463 = nil;
        local v464;
        do
            local l_v463_0 = v463;
            pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_v463_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v463_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v464 = l_v463_0;
        end;
        v462.clientId = v464;
        v462.status = v451;
        v462.bundleType = v452;
        v462.operationId = v453;
        v462.assetIds = v454;
        v462.creationStatusId = v455;
        v462.bundleId = v456;
        v462.errors = v457;
        l_sendEventDeferred_13(v459, v460, v461, v462);
    end;
end;
if l_game_EngineFeature_0 then
    v23.onAudioAssetGrantedToUserInventoryEvent = function(v466) --[[ Line: 999 ]] --[[ Name: onAudioAssetGrantedToUserInventoryEvent ]]
        -- upvalues: v3 (copy), v13 (copy), v23 (copy), v17 (copy), l_RbxAnalyticsService_0 (copy)
        local l_sendEventDeferred_14 = v3.sendEventDeferred;
        local v468 = if v13() then v23.eventTarget else "studio";
        local v469 = "toolboxInsert";
        local v470 = "AudioGrantedToUserInventory";
        local v471 = {
            assetId = v466, 
            placeid = v17()
        };
        local v472 = nil;
        local v473;
        do
            local l_v472_0 = v472;
            pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_v472_0 (ref), l_RbxAnalyticsService_0 (ref)
                l_v472_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v473 = l_v472_0;
        end;
        v471.sessionid = v473;
        l_sendEventDeferred_14(v468, v469, v470, v471);
    end;
end;
return v23;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Actions.GetAssets);
local v5 = require(l_Parent_0.Core.Actions.GetVote);
local v6 = require(l_Parent_0.Core.Actions.GetAssetsVotingData);
local v7 = require(l_Parent_0.Core.Actions.PostInsertAsset);
local v8 = require(l_Parent_0.Core.Actions.PostUnvote);
local v9 = require(l_Parent_0.Core.Actions.PostVote);
local v10 = require(l_Parent_0.Core.Actions.SetVoteLoading);
local function v15(v11, v12, v13) --[[ Line: 15 ]] --[[ Name: handleGetVote ]]
    -- upvalues: v2 (copy)
    local v14 = v13 ~= nil;
    return v2.Dictionary.join(v11, {
        [v12] = v2.Dictionary.join(v11[v12], {
            HasVoted = v14, 
            UserVote = v13, 
            showVoteButtons = v14
        })
    });
end;
local function v23(v16, v17, v18) --[[ Line: 26 ]] --[[ Name: handleVoting ]]
    -- upvalues: v2 (copy)
    local v19 = v16[v17];
    local l_UpVotes_0 = v19.UpVotes;
    local l_DownVotes_0 = v19.DownVotes;
    local l_VoteCount_0 = v19.VoteCount;
    if v18 then
        if v19.HasVoted and not v19.UserVote then
            l_DownVotes_0 = v19.DownVotes - 1;
            l_VoteCount_0 = l_VoteCount_0 - 1;
        end;
        l_UpVotes_0 = v19.UpVotes + 1;
        l_VoteCount_0 = l_VoteCount_0 + 1;
    else
        if v19.HasVoted and v19.UserVote then
            l_UpVotes_0 = v19.UpVotes - 1;
            l_VoteCount_0 = l_VoteCount_0 - 1;
        end;
        l_DownVotes_0 = v19.DownVotes + 1;
        l_VoteCount_0 = l_VoteCount_0 + 1;
    end;
    return v2.Dictionary.join(v16, {
        [v17] = v2.Dictionary.join(v16[v17], {
            HasVoted = true, 
            UserVote = v18, 
            UpVotes = l_UpVotes_0, 
            DownVotes = l_DownVotes_0, 
            VoteCount = v19.VoteCount, 
            showVoteButtons = true
        })
    });
end;
local function v30(v24, v25) --[[ Line: 66 ]] --[[ Name: handleUnvoting ]]
    -- upvalues: v2 (copy)
    local v26 = v24[v25];
    local l_UpVotes_1 = v26.UpVotes;
    local l_DownVotes_1 = v26.DownVotes;
    local l_VoteCount_1 = v26.VoteCount;
    if v26.HasVoted then
        if v26.UserVote == true then
            l_UpVotes_1 = l_UpVotes_1 - 1;
        else
            l_DownVotes_1 = l_DownVotes_1 - 1;
        end;
        l_VoteCount_1 = l_VoteCount_1 - 1;
    end;
    return v2.Dictionary.join(v24, {
        [v25] = v2.Dictionary.join(v24[v25], {
            HasVoted = false, 
            UserVote = v2.None, 
            UpVotes = l_UpVotes_1, 
            DownVotes = l_DownVotes_1, 
            VoteCount = v26.VoteCount
        })
    });
end;
local function v34(v31, v32) --[[ Line: 91 ]] --[[ Name: setShowVoteButtons ]]
    -- upvalues: v2 (copy)
    local v33 = v31[v32] or {};
    return v2.Dictionary.join(v31, {
        [v32] = v2.Dictionary.join(v33, {
            showVoteButtons = true
        })
    });
end;
local function v40(v35, v36, v37, v38) --[[ Line: 107 ]] --[[ Name: setVoteLoading ]]
    -- upvalues: v2 (copy)
    local v39 = v35[v36] or {};
    return v2.Dictionary.join(v35, {
        [v36] = v2.Dictionary.join(v39, {
            VoteLoading = v37, 
            VoteFetchAttempted = v38
        })
    });
end;
local function v47(v41, v42) --[[ Line: 117 ]] --[[ Name: updateAssetVotes ]]
    -- upvalues: v2 (copy)
    local v43 = {};
    for _, v45 in ipairs(v42.assets) do
        local _ = v41[v45.Asset.Id];
        v43[v45.Asset.Id] = v45.Voting;
    end;
    return v2.Dictionary.join(v41, v43);
end;
return v3.createReducer({}, {
    [v4.name] = function(v48, v49) --[[ Line: 127 ]]
        -- upvalues: v47 (copy)
        return v47(v48, v49);
    end, 
    [v6.name] = function(v50, v51) --[[ Line: 131 ]]
        -- upvalues: v47 (copy)
        return v47(v50, v51);
    end, 
    [v7.name] = function(v52, v53) --[[ Line: 135 ]]
        -- upvalues: v34 (copy)
        return v34(v52, v53.assetId);
    end, 
    [v5.name] = function(v54, v55) --[[ Line: 139 ]]
        -- upvalues: v15 (copy)
        return v15(v54, v55.assetId, v55.userVote);
    end, 
    [v9.name] = function(v56, v57) --[[ Line: 143 ]]
        -- upvalues: v23 (copy)
        return v23(v56, v57.assetId, v57.userVote);
    end, 
    [v8.name] = function(v58, v59) --[[ Line: 147 ]]
        -- upvalues: v30 (copy)
        return v30(v58, v59.assetId);
    end, 
    [v10.name] = function(v60, v61) --[[ Line: 151 ]]
        -- upvalues: v40 (copy)
        return v40(v60, v61.AssetId, v61.VoteLoading, v61.VoteFetchAttempted);
    end
});
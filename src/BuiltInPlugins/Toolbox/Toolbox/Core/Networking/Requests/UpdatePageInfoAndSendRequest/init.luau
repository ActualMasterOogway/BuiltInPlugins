local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.GetAssetsRequest);
local v3 = require(l_Parent_0.Core.Networking.Requests.GetToolboxItems);
local v4 = require(l_Parent_0.Core.Types.Category);
local v5 = require(l_Parent_0.Core.Actions.ClearAssets);
local v6 = require(l_Parent_0.Core.Actions.UpdatePageInfo);
local v7 = require(l_Parent_0.Core.Util.Constants);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
return function(v9, v10, v11) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), l_showRobloxCreatedAssets_0 (copy), v7 (copy), v4 (copy), v3 (copy), v2 (copy)
    return function(v12) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v11 (copy), v5 (ref), v6 (ref), v10 (copy), l_showRobloxCreatedAssets_0 (ref), v7 (ref), v4 (ref), v3 (ref), v9 (copy), v2 (ref)
        if not v1.IsUpdate(v11.requestReason) then
            v12:dispatch(v5());
        end;
        v12:dispatch(v6(v11, v10));
        local l_pageInfo_0 = v12:getState().pageInfo;
        local l_audioSearchInfo_0 = l_pageInfo_0.audioSearchInfo;
        local l_categoryName_0 = l_pageInfo_0.categoryName;
        if l_showRobloxCreatedAssets_0() and l_audioSearchInfo_0 == nil then
            l_audioSearchInfo_0 = {
                minDuration = 0, 
                maxDuration = v7.MAX_AUDIO_SEARCH_DURATION
            };
        end;
        if v4.API_NAMES[l_categoryName_0] then
            v12:dispatch(v3(v9, l_categoryName_0, l_audioSearchInfo_0, l_pageInfo_0, v10));
            return;
        else
            v12:dispatch(v2(v9, l_pageInfo_0));
            return;
        end;
    end;
end;
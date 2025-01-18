local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Analytics_0 = require(l_Packages_0.Framework).ContextServices.Analytics;
local v3 = require(l_Parent_0.Core.Util.Analytics.Senders);
local function v6(v4, v5) --[[ Line: 9 ]] --[[ Name: trackMarketplaceEvent ]]
    -- upvalues: v3 (copy)
    v3.sendEventDeferred("studio", "Marketplace", v4, v5);
end;
return function() --[[ Line: 13 ]]
    -- upvalues: l_Analytics_0 (copy), v6 (copy)
    return l_Analytics_0.new(function(_) --[[ Line: 14 ]]
        -- upvalues: v6 (ref)
        return {
            AssetPreviewPlaySound = v6, 
            AssetPreviewPauseSound = v6, 
            AssetPreviewPlayVideo = v6, 
            AssetPreviewPauseVideo = v6
        };
    end);
end;
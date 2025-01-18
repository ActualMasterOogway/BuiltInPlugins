local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v1 (ref)
        local v4 = v3:getState().pageInfo or {};
        if v2.shouldDebugWarnings() and not v4.searchId then
            warn("no searchId in pageInfo, analytics won't be tracked for asset");
        end;
        return {
            category = "Studio", 
            currentCategory = v1.getCategoryForPageInfo(v4), 
            page = v4.targetPage, 
            sort = v1.getSortTypeForPageInfo(v4), 
            searchId = v4.searchId, 
            searchKeyword = v4.searchTerm, 
            toolboxTab = v1.getCurrentTab(v4), 
            isTopKeyword = v4.isTopKeyword
        };
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.VirtualizedList);
local v5 = require(l_Parent_0.Src.Resources.StyleTips);
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local v7 = require(l_Parent_0.Src.Components.ActivityHistoryBubble);
local v8 = require(l_Parent_0.Src.Components.ActivityHistoryBubbleListSectionHeader);
local v9 = require(l_Parent_0.Src.Components.ActivityHistoryBubbleListFooter);
local v10 = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v11 = require(l_Parent_0.Src.Components.ListLoadingIndicator);
local v12 = require(l_Parent_0.Src.Components.ListEmptyComponent);
local v13 = require(l_Parent_0.Src.Hooks.UsernameCache);
local l_VirtualizedList_0 = v4.VirtualizedList;
local l_Localization_0 = v2.ContextServices.Localization;
local l_keys_0 = v3.Dictionary.keys;
local l_values_0 = v3.Dictionary.values;
local l_joinTags_0 = v2.Styling.joinTags;
local v19 = v2.Util.LayoutOrderIterator.new();
local function v22(v20, v21) --[[ Line: 46 ]] --[[ Name: getItem ]]
    if v20 and v20[v21] then
        if v20[v21].key == nil then
            v20[v21].key = v20[v21].id;
        end;
        return v20[v21];
    else
        return nil;
    end;
end;
local function v24(v23) --[[ Line: 59 ]] --[[ Name: getItemCount ]]
    if v23 == nil then
        return 0;
    else
        return #v23;
    end;
end;
local function v27(_, v26) --[[ Line: 66 ]] --[[ Name: getItemLayout ]]
    -- upvalues: v5 (copy)
    return {
        length = v5.bubbleHeight, 
        offset = v5.bubbleHeight * v26, 
        index = v26
    };
end;
local function v29(v28) --[[ Line: 74 ]] --[[ Name: renderItem ]]
    -- upvalues: v1 (copy), l_joinTags_0 (copy), v8 (copy), v19 (copy), v7 (copy), v9 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Border", "X-Fill", "CX-Invisible", "Component-BubbleFrame", "X-Column")
    }, {
        BubbleHeader = if v28.item.headerText ~= nil then v1.createElement(v8, {
            title = v28.item.headerText, 
            layoutOrder = v19:getNextOrder()
        }) else nil, 
        BubbleContainer = v1.createElement(v7, {
            Bubble = v28.item, 
            LayoutOrder = v19:getNextOrder()
        }), 
        BubbleFooter = if v28.item.footerText ~= nil then v1.createElement(v9, {
            title = v28.item.footerText, 
            layoutOrder = v19:getNextOrder()
        }) else nil
    });
end;
local function v46() --[[ Line: 100 ]] --[[ Name: useTranslatedEventCache ]]
    -- upvalues: v13 (copy), v1 (copy), l_Localization_0 (copy), v10 (copy), l_keys_0 (copy)
    local v30 = v13();
    local v31, _ = v1.useState({});
    local v33 = l_Localization_0:use();
    local function v45(v34) --[[ Line: 105 ]] --[[ Name: getTranslations ]]
        -- upvalues: v30 (copy), v33 (copy), v31 (copy), v10 (ref), l_keys_0 (ref)
        local v35 = {};
        local v36 = {};
        for _, v38 in pairs(v34) do
            local v39 = false;
            do
                local l_v39_0 = v39;
                local function v43(v41) --[[ Line: 110 ]] --[[ Name: getUsername ]]
                    -- upvalues: v30 (ref), l_v39_0 (ref), v36 (copy), v33 (ref)
                    if v41 ~= nil then
                        local v42 = v30.cache[v41];
                        if v42 then
                            return v42;
                        else
                            l_v39_0 = true;
                            v36[v41] = true;
                        end;
                    end;
                    return v33:getText("Bubble", "Unknown");
                end;
                local v44 = v31[v38.id];
                if not v44 or v44.headerText ~= v38.headerText or v44.footerText ~= v38.footerText then
                    v44 = v10.translateEvent(v43, v33, v38);
                    if not l_v39_0 then
                        v31[v38.id] = v44;
                    end;
                end;
                table.insert(v35, v44);
            end;
        end;
        v30.fetchUsernames(l_keys_0(v36));
        return v35;
    end;
    return {
        updated = v30.cache, 
        getTranslations = v45
    };
end;
local v47 = {
    minimumViewTime = 2000, 
    viewAreaCoveragePercentThreshold = 80, 
    itemVisiblePercentThreshold = nil, 
    waitForInteraction = false
};
return function(v48) --[[ Line: 174 ]] --[[ Name: ActivityHistoryBubbleList ]]
    -- upvalues: v46 (copy), v1 (copy), l_values_0 (copy), v47 (copy), l_joinTags_0 (copy), l_VirtualizedList_0 (copy), v22 (copy), v24 (copy), v27 (copy), v29 (copy), v11 (copy), v12 (copy)
    local v49 = v46();
    local v51 = v1.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v49 (copy), v48 (copy), l_values_0 (ref)
        local v50 = v49.getTranslations(v48.Events);
        return l_values_0(v50);
    end, {
        v48.Events, 
        v49.updated
    });
    local v56 = v1.useCallback(function(v52) --[[ Line: 182 ]]
        -- upvalues: v48 (copy)
        local v53 = {};
        for _, v55 in pairs(v52.viewableItems) do
            v53[v55.key] = true;
        end;
        v48.OnViewableItemsChanged(v53);
    end, {
        v48.OnViewableItemsChanged
    });
    local v57 = v1.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: v47 (ref), v56 (copy)
        return {
            viewabilityConfig = v47, 
            onViewableItemsChanged = v56
        };
    end, {
        v56
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Fill", "CX-Invisible", "Component-ActivityHistoryBubbleList")
    }, {
        VirtualizedList = v1.createElement(l_VirtualizedList_0, {
            keyExtractor = function(v58) --[[ Line: 204 ]] --[[ Name: keyExtractor ]]
                return v58.id;
            end, 
            ref = v48.Vlref, 
            data = v51, 
            getItem = v22, 
            getItemCount = v24, 
            getItemLayout = v27, 
            renderItem = v29, 
            windowSize = 3, 
            viewabilityConfigCallbackPairs = {
                v57
            }, 
            showsVerticalScrollIndicator = false, 
            showsHorizontalScrollIndicator = false, 
            showDefaultLoadingIndicators = false, 
            ListHeaderComponent = v48.ShowHeaderLoadingIndicator and v11 or nil, 
            ListFooterComponent = v48.ShowFooterLoadingIndicator and v11 or nil, 
            onScroll = v48.OnScroll, 
            ListEmptyComponent = v1.createElement(v12, {
                openFiltersFn = v48.OpenFiltersFn
            })
        })
    });
end;
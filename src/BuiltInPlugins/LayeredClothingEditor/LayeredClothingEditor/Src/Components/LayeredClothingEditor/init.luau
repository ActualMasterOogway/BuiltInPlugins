local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_EditingItemContext_0 = v2.Contexts.EditingItemContext;
local l_ItemCharacteristics_0 = v2.Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local v5 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v5.ContextServices.withContext;
local l_ScreenFlow_0 = v5.UI.ScreenFlow;
local v8 = require(l_Parent_0.Src.Components.Screens.AssetTypeScreen);
local v9 = require(l_Parent_0.Src.Components.Screens.EditorScreen);
local v10 = require(l_Parent_0.Src.Components.Screens.SelectItemScreen);
local _ = require(l_Parent_0.Src.Components.Screens.GenerateScreen);
local v12 = require(l_Parent_0.Src.Components.Preview.SelectedEditingItem);
local v13 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v14 = require(l_Parent_0.Src.Util.Constants);
local v15 = v1.PureComponent:extend("LayeredClothingEditor");
v15.init = function(v16) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v14 (copy), v10 (copy), v8 (copy), v9 (copy), l_ItemCharacteristics_0 (copy)
    v13.StartTime = os.time();
    v16.screenInfo = {
        {
            Id = v14.SCREENS.Select, 
            Component = v10
        }, 
        {
            Id = v14.SCREENS.AssetType, 
            Component = v8
        }, 
        {
            Id = v14.SCREENS.Edit, 
            Component = v9
        }
    };
    v16.screens = {};
    for _, v18 in ipairs(v16.screenInfo) do
        table.insert(v16.screens, v18.Component);
    end;
    v16.screenToIndexMap = {};
    for v19, v20 in ipairs(v16.screens) do
        v16.screenToIndexMap[v20] = v19;
    end;
    v16.onScreenChanged = function(v21) --[[ Line: 60 ]]
        -- upvalues: v13 (ref), v16 (copy)
        v13.CurrentScreen = v16.screenInfo[v21].Id;
    end;
    v16.getNextIndex = function(v22) --[[ Line: 64 ]]
        -- upvalues: v16 (copy), v10 (ref), l_ItemCharacteristics_0 (ref), v9 (ref), v8 (ref)
        local v23 = nil;
        if v22 == v16.screenToIndexMap[v10] then
            local v24 = v16.props.EditingItemContext:getSourceItem();
            v23 = if l_ItemCharacteristics_0.isAvatar(v24) then v16.screenToIndexMap[v9] else v16.screenToIndexMap[v8];
        else
            v23 = v22 + 1;
        end;
        v23 = v23 % #v16.screens;
        return v23 == 0 and #v16.screens or v23;
    end;
    v16.getPreviousIndex = function(v25) --[[ Line: 80 ]]
        -- upvalues: v16 (copy), v9 (ref), l_ItemCharacteristics_0 (ref), v10 (ref), v8 (ref)
        local _ = nil;
        if v25 == v16.screenToIndexMap[v9] then
            local v27 = v16.props.EditingItemContext:getSourceItem();
            if l_ItemCharacteristics_0.isAvatar(v27) then
                return v16.screenToIndexMap[v10];
            else
                return v16.screenToIndexMap[v8];
            end;
        else
            return v25 - 1;
        end;
    end;
end;
v15.render = function(v28) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v12 (copy), l_ScreenFlow_0 (copy)
    return v1.createFragment({
        SelectedEditingItem = v1.createElement(v12), 
        ScreenFlow = v1.createElement(l_ScreenFlow_0, {
            Screens = v28.screens, 
            GetNextIndex = v28.getNextIndex, 
            GetPreviousIndex = v28.getPreviousIndex, 
            OnScreenChanged = v28.onScreenChanged
        })
    });
end;
v15.willUnmount = function(v29) --[[ Line: 108 ]] --[[ Name: willUnmount ]]
    v29.props.EditingItemContext:clear();
end;
return (l_withContext_0({
    EditingItemContext = l_EditingItemContext_0
})(v15));
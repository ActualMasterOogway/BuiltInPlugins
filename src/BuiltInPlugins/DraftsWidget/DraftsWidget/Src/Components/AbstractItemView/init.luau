local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_showContextMenu_0 = v3.UI.showContextMenu;
local v7 = v1.PureComponent:extend("AbstractItemView");
v7.init = function(v8) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_showContextMenu_0 (copy), v2 (copy)
    v8:setState({
        selection = {}, 
        selectionAnchorTop = nil, 
        selectionAnchorBottom = nil
    });
    v8.lastItemClicked = nil;
    v8.lastClickTime = 0;
    v8.getPressedModifiers = function(v9) --[[ Line: 71 ]]
        return {
            Toggle = v9:IsModifierKeyDown(Enum.ModifierKey.Ctrl), 
            Expand = v9:IsModifierKeyDown(Enum.ModifierKey.Shift)
        };
    end;
    v8.itemRightClicked = function(v10) --[[ Line: 78 ]]
        -- upvalues: v8 (copy), l_showContextMenu_0 (ref)
        if not v8.props.MakeMenuActions then
            return;
        else
            if not v8.state.selection[v10] then
                v8.setSelection(v10);
            end;
            local v11 = v8.props.Plugin:get();
            local v12 = v8.makeMenuActions();
            task.spawn(function() --[[ Line: 88 ]]
                -- upvalues: l_showContextMenu_0 (ref), v11 (copy), v12 (copy)
                l_showContextMenu_0(v11, v12);
            end);
            return;
        end;
    end;
    v8.itemClicked = function(v13, v14) --[[ Line: 93 ]]
        -- upvalues: v8 (copy)
        local v15 = v8.getPressedModifiers(v14);
        if v15.Expand then
            v8.expandSelection(v13);
        elseif v15.Toggle then
            v8.toggleSelected(v13);
        else
            v8.setSelection(v13);
        end;
        if v8.lastItemClicked == v13 then
            if tick() - v8.lastClickTime < 0.5 then
                v8.itemDoubleClicked(v13);
                v8.lastItemClicked = nil;
            end;
        else
            v8.lastItemClicked = v13;
        end;
        v8.lastClickTime = tick();
    end;
    v8.itemDoubleClicked = function(v16) --[[ Line: 116 ]]
        -- upvalues: v8 (copy)
        if v8.props.OnDoubleClicked then
            v8.props.OnDoubleClicked(v16);
        end;
    end;
    v8.selectionChanged = function(v17) --[[ Line: 122 ]]
        -- upvalues: v8 (copy)
        if v8.props.OnSelectionChanged then
            v8.props.OnSelectionChanged(v17);
        end;
    end;
    v8.setSelection = function(v18) --[[ Line: 129 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            selection = {
                [v18] = true
            }, 
            selectionAnchorTop = v18, 
            selectionAnchorBottom = v18
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.toggleSelected = function(v19) --[[ Line: 139 ]]
        -- upvalues: v8 (copy), v2 (ref)
        local l_Items_0 = v8.props.Items;
        local v21 = v8.state.selection[v19] ~= nil;
        local v22 = v2.Dictionary.join(v8.state.selection, {
            [v19] = not v21 or v2.None or true
        });
        local v23 = nil;
        local v24 = nil;
        for _, v26 in ipairs(l_Items_0) do
            if v22[v26] then
                v23 = v23 or v26;
                v24 = v26;
            end;
        end;
        v8:setState({
            selection = v22, 
            selectionAnchorTop = v23, 
            selectionAnchorBottom = v24
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.expandSelection = function(v27) --[[ Line: 164 ]]
        -- upvalues: v8 (copy)
        local l_Items_1 = v8.props.Items;
        local v29 = nil;
        local v30 = nil;
        local v31 = nil;
        for v32, v33 in ipairs(l_Items_1) do
            if v33 == v8.state.selectionAnchorTop then
                v29 = v32;
            end;
            if v33 == v8.state.selectionAnchorBottom then
                v30 = v32;
            end;
            if v33 == v27 then
                v31 = v32;
            end;
        end;
        v29 = v29 or v31;
        v30 = v30 or v31;
        local v34 = {};
        for v35 = math.min(v29, v31), math.max(v30, v31) do
            v34[l_Items_1[v35]] = true;
        end;
        v8:setState({
            selection = v34
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.makeMenuActions = function() --[[ Line: 196 ]]
        -- upvalues: v8 (copy)
        local l_Items_2 = v8.props.Items;
        local l_MakeMenuActions_0 = v8.props.MakeMenuActions;
        local v38 = {};
        for _, v40 in ipairs(l_Items_2) do
            if v8.state.selection[v40] then
                table.insert(v38, v40);
            end;
        end;
        return l_MakeMenuActions_0(v38);
    end;
    v8.getSelectedIds = function() --[[ Line: 209 ]]
        -- upvalues: v8 (copy)
        local v41 = {};
        for _, v43 in ipairs(v8.props.Items) do
            if v8.state.selection[v43] then
                table.insert(v41, v43);
            end;
        end;
        return v41;
    end;
    if v8.props.GetCurrentSelection then
        v8.props.GetCurrentSelection.OnInvoke = v8.getSelectedIds;
    end;
end;
v7.didUpdate = function(v44, v45, _) --[[ Line: 225 ]] --[[ Name: didUpdate ]]
    if v45.GetCurrentSelection ~= v44.props.GetCurrentSelection then
        if v45.GetCurrentSelection then
            v45.GetCurrentSelection.OnInvoke = nil;
        end;
        if v44.props.GetCurrentSelection then
            v44.props.GetCurrentSelection.OnInvoke = v44.getSelectedIds;
        end;
    end;
end;
v7.render = function(v47) --[[ Line: 236 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_Items_3 = v47.props.Items;
    local l_RenderItem_0 = v47.props.RenderItem;
    local l_RenderContents_0 = v47.props.RenderContents;
    local v51 = {};
    local v52 = {};
    for v53, v54 in ipairs(l_Items_3) do
        local v55 = v47.state.selection[v54] == true;
        v51[v54] = true;
        v52[v54] = {
            Button = l_RenderItem_0(v54, {
                Selected = v55, 
                OnPress = function(_, _, v58) --[[ Line: 249 ]] --[[ Name: OnPress ]]
                    -- upvalues: v47 (copy), v54 (copy)
                    v47.itemClicked(v54, v58);
                end, 
                OnSecondaryPress = function() --[[ Line: 252 ]] --[[ Name: OnSecondaryPress ]]
                    -- upvalues: v47 (copy), v54 (copy)
                    v47.itemRightClicked(v54);
                end
            }), 
            Index = v53
        };
    end;
    local v59 = false;
    for v60, _ in pairs(v47.state.selection) do
        if not v51[v60] then
            v47.state.selection[v60] = nil;
            v59 = true;
        end;
    end;
    if v59 then
        v47.selectionChanged(v47.state.selection);
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Contents = l_RenderContents_0(v52)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v7));
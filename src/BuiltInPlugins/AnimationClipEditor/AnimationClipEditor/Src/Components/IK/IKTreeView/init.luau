local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TreeView_0 = v6.UI.TreeView;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v11 = require(l_script_FirstAncestor_0.Src.Components.IK.IKTreeRow);
local v12 = v5.PureComponent:extend("IKTreeView");
v12.init = function(v13) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v10 (copy), v2 (copy), v1 (copy)
    local v14 = {};
    local v15 = v4.getMotors(v13.props.RootInstance);
    local v16 = if v10() then v4.getAnimationConstraints(v13.props.RootInstance) else nil;
    for _, v18 in ipairs(v15) do
        v14[v18.Part1.Name] = true;
    end;
    if v10() then
        for _, v20 in v16 do
            v14[v20.Attachment1.Parent.Name] = true;
        end;
    end;
    v14[v4.findRootPart(v13.props.RootInstance).Name] = true;
    v13.state = {
        expandedItems = v14, 
        treeArray = {}
    };
    v13.getChildren = function(v21) --[[ Line: 65 ]]
        -- upvalues: v15 (copy), v10 (ref), v16 (copy)
        local v22 = {};
        for _, v24 in ipairs(v15) do
            if v24.Part0.Name == v21 then
                table.insert(v22, v24.Part1.Name);
            end;
        end;
        if v10() then
            for _, v26 in v16 do
                if v26.Attachment0.Parent.Name == v21 then
                    table.insert(v22, v26.Attachment1.Parent.Name);
                end;
            end;
        end;
        return v22;
    end;
    v13.onInputBegan = function(v27, v28) --[[ Line: 82 ]]
        -- upvalues: v13 (copy)
        if v27.UserInputType == Enum.UserInputType.MouseButton1 then
            v13.props.SetSelectedTracks({
                {
                    v28
                }
            });
        end;
    end;
    v13.getVerticalLineHeight = function(v29, v30) --[[ Line: 88 ]]
        -- upvalues: v13 (copy), v2 (ref)
        local v31 = 1;
        local v32 = {};
        local v33 = v13.getChildren(v29);
        for v34, v35 in ipairs(v13.state.treeArray) do
            if v35 == v29 then
                v31 = v34;
            end;
            for _, v37 in ipairs(v33) do
                if v37 == v35 and (not v30 or v13.props.Chain[v37]) then
                    table.insert(v32, {
                        index = v34, 
                        element = v37
                    });
                end;
            end;
        end;
        table.sort(v32, function(v38, v39) --[[ Line: 105 ]]
            return v38.index < v39.index;
        end);
        local l_v31_0 = v31;
        if #v32 > 0 then
            l_v31_0 = v32[#v32].index;
        end;
        return (l_v31_0 - v31) * v2.TRACK_HEIGHT;
    end;
    v13.toggleExpanded = function(v41) --[[ Line: 115 ]]
        -- upvalues: v13 (copy), v1 (ref)
        v13:setState(function(v42) --[[ Line: 116 ]]
            -- upvalues: v1 (ref), v41 (copy)
            return {
                expandedItems = v1.Dictionary.join(v42.expandedItems, {
                    [v41] = not v42.expandedItems[v41]
                })
            };
        end);
    end;
    v13.contributeItem = function(v43, v44, v45) --[[ Line: 125 ]]
        -- upvalues: v13 (copy)
        table.insert(v45, v43);
        if v13.state.expandedItems[v43] then
            local v46 = v13.getChildren(v43);
            for _, v48 in ipairs(v46) do
                v13.contributeItem(v48, v44 + 1, v45);
            end;
        end;
        return v45;
    end;
    v13.calculateRows = function(v49) --[[ Line: 136 ]]
        -- upvalues: v13 (copy), v4 (ref)
        if v49 and v13.state.expandedItems == v49.expandedItems then
            return;
        else
            local v50 = {};
            v13.contributeItem(v4.findRootPart(v13.props.RootInstance).Name, 0, v50);
            v13:setState({
                treeArray = v50
            });
            v13.props.OnTreeUpdated(v50);
            return;
        end;
    end;
    v13.getRowProps = function(v51, v52, v53, v54) --[[ Line: 147 ]]
        -- upvalues: v13 (copy)
        local l_props_0 = v13.props;
        local l_SelectedTrack_0 = l_props_0.SelectedTrack;
        local l_item_0 = v51.item;
        return {
            Chain = l_props_0.Chain, 
            Depth = v51.depth, 
            GetVerticalLineHeight = v13.getVerticalLineHeight, 
            IsExpanded = v13.state.expandedItems[l_item_0], 
            IsLeafNode = #v13.getChildren(l_item_0) == 0, 
            Item = l_item_0, 
            Key = v52, 
            OnInputBegan = v13.onInputBegan, 
            OnToggleExpanded = v13.toggleExpanded, 
            PinnedParts = l_props_0.PinnedParts, 
            Position = v53, 
            RootInstance = l_props_0.RootInstance, 
            IKMode = l_props_0.IKMode, 
            IsSelected = l_SelectedTrack_0 and l_SelectedTrack_0[1] == l_item_0, 
            Size = v54, 
            TogglePinnedPart = l_props_0.TogglePinnedPart
        };
    end;
end;
v12.didMount = function(v58) --[[ Line: 172 ]] --[[ Name: didMount ]]
    v58.calculateRows();
end;
v12.didUpdate = function(v59, _, v61) --[[ Line: 176 ]] --[[ Name: didUpdate ]]
    v59.calculateRows(v61);
end;
v12.render = function(v62) --[[ Line: 180 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), l_TreeView_0 (copy), v11 (copy), v2 (copy)
    local l_props_1 = v62.props;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    local l_RootInstance_0 = l_props_1.RootInstance;
    local v67 = v4.findRootPart(l_RootInstance_0);
    local v68 = {};
    table.insert(v68, v67.Name);
    return v5.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1
    }, {
        TreeView = v5.createElement(l_TreeView_0, {
            RootItems = v68, 
            GetChildren = v62.getChildren, 
            Expansion = v62.state.expandedItems, 
            RowComponent = v11, 
            RowHeight = v2.TRACK_HEIGHT, 
            GetRowProps = v62.getRowProps, 
            Style = "BorderBox"
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
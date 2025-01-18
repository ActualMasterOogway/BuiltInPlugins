local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ItemState);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v7 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetCharacterSelection);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v10 = require(l_Components_0.SelectAllRow);
local v11 = require(l_Components_0.CharacterConversion.SplitView);
local v12 = require(l_Components_0.CharacterConversion.ExpandableCharacterListItem);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.CreateWorldModels);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_deepCopy_0 = v2.Util.deepCopy;
local v20 = v3.PureComponent:extend("CharacterConversionList");
v20.init = function(v21) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy), l_deepCopy_0 (copy)
    v21.state = {
        expandedNestedItem = {
            [v5.InProgress] = true
        }, 
        expanded = nil
    };
    v21.onKeyPressed = function(v22) --[[ Line: 42 ]]
        -- upvalues: v6 (ref), v21 (copy)
        if v6:isShift(v22.KeyCode) then
            v21._shiftDown = true;
        elseif v6:isControl(v22.KeyCode) then
            v21._ctrlDown = true;
        end;
        if v21._shiftDown and v21._ctrlDown and v6:isLetterA(v22.KeyCode) then
            v21.selectAll();
        end;
    end;
    v21.onKeyReleased = function(v23) --[[ Line: 54 ]]
        -- upvalues: v6 (ref), v21 (copy)
        if v6:isShift(v23.KeyCode) then
            v21._shiftDown = false;
            return;
        else
            if v6:isControl(v23.KeyCode) then
                v21._ctrlDown = false;
            end;
            return;
        end;
    end;
    v21.plainSelect = function(v24) --[[ Line: 62 ]]
        -- upvalues: v21 (copy)
        v21.props.SetCharacterSelection({
            v24.key
        });
    end;
    v21.plainToggleSelect = function(v25) --[[ Line: 66 ]]
        -- upvalues: l_deepCopy_0 (ref), v21 (copy)
        local v26 = l_deepCopy_0(v21.props.selection);
        local v27 = table.find(v26, v25.key);
        if v27 then
            table.remove(v26, v27);
        else
            table.insert(v26, v25.key);
        end;
        v21.props.SetCharacterSelection(v26);
    end;
    v21.selectAll = function() --[[ Line: 77 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        local l_Items_0 = l_props_0.Items;
        local v30 = {};
        local l_expandedNestedItem_0 = v21.state.expandedNestedItem;
        local v32 = {};
        for _, v34 in l_Items_0 do
            if l_expandedNestedItem_0[v34.key] then
                for _, v36 in v34.children do
                    if not v32[v36.key] then
                        v32[v36.key] = true;
                        table.insert(v30, v36.key);
                    end;
                end;
            end;
        end;
        l_props_0.SetCharacterSelection(v30);
    end;
    v21.selectInRange = function(v37, v38, v39, v40, v41, v42) --[[ Line: 101 ]]
        local v43 = {};
        for _, v45 in v38 do
            v43[v45] = true;
        end;
        local v46 = v37[v39];
        local v47 = v37[v41];
        if v39 == v41 then
            for v48 = v40, v42 do
                local l_key_0 = v46.children[v48].key;
                if not v43[l_key_0] then
                    table.insert(v38, l_key_0);
                    v43[l_key_0] = true;
                end;
            end;
            return;
        else
            for v50 = v40, #v46.children do
                local l_key_1 = v46.children[v50].key;
                if not v43[l_key_1] then
                    table.insert(v38, v46.children[v50].key);
                    v43[l_key_1] = true;
                end;
            end;
            for v52 = 1, v42 do
                local l_key_2 = v47.children[v52].key;
                if not v43[l_key_2] then
                    table.insert(v38, v47.children[v52].key);
                    v43[l_key_2] = true;
                end;
            end;
            return;
        end;
    end;
    v21.areAllChildrenSelected = function(v54) --[[ Line: 145 ]]
        -- upvalues: v21 (copy)
        local l_props_1 = v21.props;
        local v56 = {};
        for _, v58 in l_props_1.selection do
            v56[v58] = true;
        end;
        for _, v60 in v54.children do
            if not v60.children and not v56[v60.key] then
                return false;
            end;
        end;
        return true;
    end;
    v21.toggleSelectAllChildren = function(v61) --[[ Line: 161 ]]
        -- upvalues: v21 (copy), l_deepCopy_0 (ref)
        local l_props_2 = v21.props;
        local v63 = {};
        if not v21.areAllChildrenSelected(v61) then
            v63 = l_deepCopy_0(l_props_2.selection);
            local v64 = {};
            for _, v66 in v63 do
                v64[v66] = true;
            end;
            for _, v68 in v61.children do
                if not v64[v68.key] and not v68.children then
                    v64[v68.key] = true;
                    table.insert(v63, v68.key);
                end;
            end;
        else
            local v69 = {};
            for _, v71 in l_props_2.selection do
                v69[v71] = true;
            end;
            for _, v73 in v61.children do
                v69[v73.key] = nil;
            end;
            for v74 in v69 do
                table.insert(v63, v74);
            end;
        end;
        l_props_2.SetCharacterSelection(v63);
    end;
    v21.getSelectionRangeData = function(v75, v76, v77) --[[ Line: 197 ]]
        local v78 = v76[#v76];
        local v79 = nil;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        for v83, v84 in v75 do
            for v85, v86 in v84.children do
                if v78 == v86.key then
                    v79 = v83;
                    v80 = v85;
                end;
                if v77.key == v86.key then
                    v81 = v83;
                    v82 = v85;
                end;
            end;
        end;
        return v79, v80, v81, v82;
    end;
    v21.shiftSelect = function(v87) --[[ Line: 222 ]]
        -- upvalues: v21 (copy), l_deepCopy_0 (ref)
        if v87.children then
            return;
        else
            local l_props_3 = v21.props;
            local l_Items_1 = l_props_3.Items;
            local v90 = l_deepCopy_0(l_props_3.selection);
            local v91, v92, v93, v94 = v21.getSelectionRangeData(l_Items_1, v90, v87);
            if v91 == nil or v92 == nil then
                v21.plainSelect(v87);
                return;
            else
                if v91 < v93 then
                    v21.selectInRange(l_Items_1, v90, v91, v92, v93, v94);
                elseif v93 < v91 then
                    v21.selectInRange(l_Items_1, v90, v93, v94, v91, v92);
                else
                    v21.selectInRange(l_Items_1, v90, v93, math.min(v94, v92), v93, (math.max(v94, v92)));
                end;
                v21.props.SetCharacterSelection(v90);
                return;
            end;
        end;
    end;
    v21.isItemSelected = function(v95) --[[ Line: 272 ]]
        -- upvalues: v21 (copy)
        for _, v97 in v21.props.selection do
            if v97 == v95.key then
                return true;
            end;
        end;
        return false;
    end;
end;
v20.getCharacterStatusKey = function(v98, v99) --[[ Line: 286 ]] --[[ Name: getCharacterStatusKey ]]
    -- upvalues: v7 (copy)
    local l_convertedCharacters_0 = v98.props.convertedCharacters;
    if not v99.characterInfo then
        return nil;
    else
        local l_model_0 = v99.characterInfo.model;
        if not l_model_0 then
            return nil;
        elseif v7.GetNpcHasWarnings(l_model_0) then
            return "Warning";
        elseif l_convertedCharacters_0[v99.characterInfo.key] then
            return "Success";
        else
            return nil;
        end;
    end;
end;
v20.renderItem = function(v102, v103, v104, v105) --[[ Line: 312 ]] --[[ Name: renderItem ]]
    -- upvalues: v3 (copy), v12 (copy), v11 (copy)
    local l_props_4 = v102.props;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_worldModels_0 = l_props_4.worldModels;
    local v111 = v3.createElement(v12, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Selected = v102.isItemSelected(v103), 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.RowHeight), 
        LayoutOrder = v105, 
        Text = v103.text, 
        Expanded = v102.state.expanded == v103.key and (l_worldModels_0[v103.key] and true or false), 
        StatusKey = v102:getCharacterStatusKey(v103), 
        RenderContent = function() --[[ Line: 325 ]] --[[ Name: RenderContent ]]
            -- upvalues: l_worldModels_0 (copy), v103 (copy), v3 (ref), v11 (ref)
            local l_previewModel_0 = l_worldModels_0[v103.key].previewModel;
            local l_convertedModel_0 = l_worldModels_0[v103.key].convertedModel;
            return v3.createElement(v11, {
                previewModel = l_previewModel_0, 
                convertedModel = l_convertedModel_0
            });
        end, 
        OnExpandedChanged = function() --[[ Line: 334 ]] --[[ Name: OnExpandedChanged ]]
            -- upvalues: l_props_4 (copy), v103 (copy), v102 (copy), v3 (ref)
            coroutine.wrap(function() --[[ Line: 335 ]]
                -- upvalues: l_props_4 (ref), v103 (ref), v102 (ref), v3 (ref)
                l_props_4.CreateWorldModels(v103.key, v103.characterInfo.model);
                v102:setState({
                    expanded = if v102.state.expanded == v103.key then v3.None else v103.key
                });
            end)();
        end, 
        OnClick = function() --[[ Line: 343 ]] --[[ Name: OnClick ]]
            -- upvalues: v102 (copy), v103 (copy)
            if v102._shiftDown then
                v102.shiftSelect(v103);
                return;
            else
                v102.plainToggleSelect(v103);
                return;
            end;
        end
    });
    v104[v103.key] = v111;
end;
v20.renderNestedItem = function(v112, v113, v114, v115) --[[ Line: 355 ]] --[[ Name: renderNestedItem ]]
    -- upvalues: v3 (copy), v10 (copy), l_ExpandablePane_0 (copy), v1 (copy)
    local l_props_5 = v112.props;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local v118 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Stylizer_1.Spacing)
        })
    };
    local v119 = 0;
    for _, v121 in v113.children do
        if v121.children then
            v112:renderNestedItem(v121, v118, v119);
        else
            if not v118.SelectAllRow then
                v118.SelectAllRow = v3.createElement(v10, {
                    IsChecked = v112.areAllChildrenSelected(v113), 
                    OnCheckboxClick = function() --[[ Line: 374 ]] --[[ Name: OnCheckboxClick ]]
                        -- upvalues: v112 (copy), v113 (copy)
                        v112.toggleSelectAllChildren(v113);
                    end, 
                    OnResetPlugin = l_props_5.OnResetPlugin
                });
            end;
            v112:renderItem(v121, v118, v119);
        end;
        v119 = v119 + 1;
    end;
    local v123 = v3.createElement(l_ExpandablePane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Style = "Section", 
        ContentPadding = 0, 
        ContentSpacing = 0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.RowHeight), 
        LayoutOrder = v115, 
        Text = v113.text, 
        Expanded = v112.state.expandedNestedItem[v113.key] or false, 
        OnExpandedChanged = function() --[[ Line: 394 ]] --[[ Name: OnExpandedChanged ]]
            -- upvalues: v112 (copy), v113 (copy), v1 (ref)
            local v122 = v112.state.expandedNestedItem[v113.key] or false;
            v112:setState({
                expandedNestedItem = v1.Dictionary.join(v112.state.expandedNestedItem, {
                    [v113.key] = not v122
                })
            });
        end
    }, v118);
    v114[v113.key] = v123;
end;
v20.render = function(v124) --[[ Line: 407 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_ScrollingFrame_0 (copy), l_KeyboardListener_0 (copy)
    local l_props_6 = v124.props;
    local l_Size_0 = l_props_6.Size;
    local l_LayoutOrder_0 = l_props_6.LayoutOrder;
    local l_Items_2 = l_props_6.Items;
    local v129 = {};
    local v130 = 0;
    for _, v132 in l_Items_2 do
        if v132.children then
            v124:renderNestedItem(v132, v129, v130);
        else
            v124:renderItem(v132, v129, v130);
        end;
        v130 = v130 + 1;
    end;
    return v3.createFragment({
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            Layout = Enum.FillDirection.Vertical, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            LayoutOrder = l_LayoutOrder_0, 
            Size = l_Size_0
        }, v129), 
        KeyboardListener = v3.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v124.onKeyPressed, 
            OnKeyReleased = v124.onKeyReleased
        })
    });
end;
v20 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v20);
return v4.connect(function(v133, _) --[[ Line: 446 ]] --[[ Name: mapStateToProps ]]
    return {
        selection = v133.CharacterConversion.selection, 
        convertedCharacters = v133.CharacterConversion.convertedCharacters, 
        worldModels = v133.CharacterConversion.worldModels
    };
end, function(v135) --[[ Line: 454 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v13 (copy)
    return {
        SetCharacterSelection = function(v136) --[[ Line: 456 ]] --[[ Name: SetCharacterSelection ]]
            -- upvalues: v135 (copy), v8 (ref)
            v135(v8(v136));
        end, 
        CreateWorldModels = function(v137, v138) --[[ Line: 460 ]] --[[ Name: CreateWorldModels ]]
            -- upvalues: v135 (copy), v13 (ref)
            v135(v13(v137, v138));
        end
    };
end)(v20);
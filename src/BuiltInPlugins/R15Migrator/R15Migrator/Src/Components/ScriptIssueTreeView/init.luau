local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetReplaceProgress);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetScriptSelection);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetScriptExpansion);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetProgressBarMessageKey);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.OnScriptsReverted);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceWithRules);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceWithSuggestion);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.RevertScripts);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UndoRevert);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.ScriptIssueRow);
local v16 = require(l_Components_0.ScriptConversionRightClickMenu);
local v17 = require(l_Components_0.SelectAllRow);
local v18 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local v19 = require(l_script_FirstAncestor_0.Src.Util.ScriptTreeManager);
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TreeView_0 = l_UI_0.TreeView;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local v25 = v1.PureComponent:extend("ScriptIssueTreeView");
v25.init = function(v26) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v16 (copy), v19 (copy)
    v26.ref = v1.createRef();
    v26.canvasPosition = Vector2.zero;
    v26.areAllSelected = function() --[[ Line: 39 ]]
        -- upvalues: v26 (copy)
        return v26.treeManager:areAllSelected(true);
    end;
    v26.onAllSelectedChecked = function() --[[ Line: 43 ]]
        -- upvalues: v26 (copy)
        if v26:areAllSelected() then
            v26.treeManager:resetSelected();
            return;
        else
            v26.treeManager:selectAll(true);
            return;
        end;
    end;
    v26.onToggle = function(v27) --[[ Line: 51 ]]
        -- upvalues: v26 (copy)
        v26.treeManager:toggleExpanded(v27.item);
    end;
    v26.onClick = function(v28) --[[ Line: 55 ]]
        -- upvalues: v26 (copy)
        v26.treeManager:onItemClicked(v28.item);
    end;
    v26.onDoubleClick = function(v29) --[[ Line: 59 ]]
        -- upvalues: v26 (copy)
        local l_ScriptConversionContext_0 = v26.props.ScriptConversionContext;
        v26.treeManager:onItemDoubleClicked(v29.item, l_ScriptConversionContext_0);
    end;
    v26.resetSelection = function() --[[ Line: 65 ]]
        -- upvalues: v26 (copy)
        v26.treeManager:resetSelected();
    end;
    v26.onKeyPressed = function(v31) --[[ Line: 69 ]]
        -- upvalues: v26 (copy)
        v26.treeManager:onKeyPressed(v31);
    end;
    v26.onKeyReleased = function(v32) --[[ Line: 73 ]]
        -- upvalues: v26 (copy)
        v26.treeManager:onKeyReleased(v32);
    end;
    v26.onRightClick = function(v33) --[[ Line: 77 ]]
        -- upvalues: v26 (copy), v16 (ref)
        v26.treeManager:onItemClicked(v33.item, true);
        v16:show(v26.treeManager:getRightClickContextInfo(v26.props, v33.item));
    end;
    v26.getRowProps = function(v34, v35, v36, v37) --[[ Line: 82 ]]
        -- upvalues: v26 (copy)
        local l_item_0 = v34.item;
        return {
            Expanded = v26.props.expansion[l_item_0], 
            Selected = v26.treeManager:itemIsSelected(l_item_0), 
            OnToggle = v26.onToggle, 
            OnClick = v26.onClick, 
            OnRightClick = v26.onRightClick, 
            OnDoubleClick = v26.onDoubleClick, 
            Key = v35, 
            Position = v36, 
            Row = v34, 
            Size = v37
        };
    end;
    v26.comparator = function(v39, v40) --[[ Line: 98 ]]
        if v39.range and v40.range then
            return v39.range < v40.range;
        else
            return v39.key > v40.key;
        end;
    end;
    v26.treeManager = v19.new();
    v26.treeManager:connectToExpandedChanged(function() --[[ Line: 107 ]]
        -- upvalues: v26 (copy)
        v26.props.SetScriptExpansion(v26.treeManager:getExpansionTable());
    end);
    v26.treeManager:connectToSelectedChanged(function() --[[ Line: 110 ]]
        -- upvalues: v26 (copy)
        v26.props.SetScriptSelection(v26.treeManager:getSelectionList());
    end);
end;
v25.getScroller = function(v41) --[[ Line: 115 ]] --[[ Name: getScroller ]]
    return v41.ref:getValue().TreeView.List;
end;
v25.didMount = function(v42) --[[ Line: 120 ]] --[[ Name: didMount ]]
    local l_props_0 = v42.props;
    local l_filter_0 = l_props_0.filter;
    local l_diagnostics_0 = l_props_0.diagnostics;
    local l_revertedScripts_0 = l_props_0.revertedScripts;
    local l_initialIssueCounts_0 = l_props_0.initialIssueCounts;
    local l_completedScripts_0 = l_props_0.completedScripts;
    local l_Localization_0 = l_props_0.Localization;
    local l_ScriptConversionContext_1 = l_props_0.ScriptConversionContext;
    local v51 = v42:getScroller();
    v42.onCanvasPositionChanged = v51:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 131 ]]
        -- upvalues: v42 (copy), v51 (copy)
        if not v42.preserveCanvasPosition then
            v42.canvasPosition = v51.CanvasPosition;
        end;
    end);
    v42.onCanvasSizeChanged = v51:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ Line: 137 ]]
        -- upvalues: v51 (copy), v42 (copy)
        if not v51 then
            return;
        else
            if v42.previousCanvasSize and v42.previousCanvasSize.Y.Offset > v51.CanvasSize.Y.Offset then
                v42.preserveCanvasPosition = true;
            end;
            if v42.preserveCanvasPosition and v42.canvasPosition and v42.canvasPosition.Y <= v51.CanvasSize.Y.Offset then
                v51.CanvasPosition = v42.canvasPosition;
                v42.preserveCanvasPosition = false;
            end;
            v42.previousCanvasSize = v51.CanvasSize;
            return;
        end;
    end);
    v42.treeManager:buildTreeItems({
        diagnostics = l_diagnostics_0, 
        completedScripts = l_completedScripts_0, 
        initialIssueCounts = l_initialIssueCounts_0, 
        revertedScripts = l_revertedScripts_0, 
        filter = if l_filter_0 ~= l_Localization_0:getText("ScriptConversion", "FilterNone") then l_filter_0 else nil, 
        Localization = l_Localization_0, 
        ScriptConversionContext = l_ScriptConversionContext_1
    });
    v42.props.SetScriptExpansion(v42.treeManager:getExpansionTable());
    v42.props.SetScriptSelection(v42.treeManager:getSelectionList());
end;
v25.render = function(v52) --[[ Line: 172 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v17 (copy), l_TreeView_0 (copy), v15 (copy), l_KeyboardListener_0 (copy)
    local l_props_1 = v52.props;
    local l_selection_0 = l_props_1.selection;
    local l_expansion_0 = l_props_1.expansion;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_SelectAllRow_0 = l_Stylizer_0.SelectAllRow;
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        ForwardRef = v52.ref, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical
    }, {
        SelectAllRow = v1.createElement(v17, {
            IsChecked = v52:areAllSelected(), 
            OnCheckboxClick = v52.onAllSelectedChecked, 
            RowHeight = l_SelectAllRow_0.RowHeight, 
            Padding = l_SelectAllRow_0.Padding, 
            OnResetPlugin = l_props_1.OnResetPlugin
        }), 
        TreeView = v1.createElement(l_TreeView_0, {
            Size = UDim2.new(1, 0, 1, -l_SelectAllRow_0.RowHeight), 
            Expansion = l_expansion_0, 
            Selection = l_selection_0, 
            RootItems = v52.treeManager:getItems() or {}, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            RowComponent = v15, 
            RowHeight = l_Stylizer_0.RowHeight, 
            GetRowProps = v52.getRowProps, 
            SortChildren = v52.comparator
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v52.onKeyPressed, 
            OnKeyReleased = v52.onKeyReleased
        })
    });
end;
v25.willUpdate = function(v60, v61, _) --[[ Line: 214 ]] --[[ Name: willUpdate ]]
    local l_props_2 = v60.props;
    local l_Localization_1 = l_props_2.Localization;
    if l_Localization_1 and (l_props_2.diagnostics ~= v61.diagnostics or l_props_2.filter ~= v61.filter) then
        v60.treeManager:buildTreeItems({
            diagnostics = v61.diagnostics, 
            completedScripts = v61.completedScripts, 
            initialIssueCounts = v61.initialIssueCounts, 
            revertedScripts = v61.revertedScripts, 
            filter = if v61.filter ~= l_Localization_1:getText("ScriptConversion", "FilterNone") then v61.filter else nil, 
            Localization = l_Localization_1, 
            ScriptConversionContext = l_props_2.ScriptConversionContext
        });
    end;
end;
v25.didUpdate = function(v65, v66, _) --[[ Line: 232 ]] --[[ Name: didUpdate ]]
    if v65.props.diagnostics ~= v66.diagnostics or v65.props.filter ~= v66.filter then
        v65.props.SetScriptExpansion(v65.treeManager:getExpansionTable());
        v65.props.SetScriptSelection(v65.treeManager:getSelectionList());
    end;
end;
v25.willUnmount = function(v68) --[[ Line: 239 ]] --[[ Name: willUnmount ]]
    v68.treeManager:terminate();
    if v68.onCanvasSizeChanged then
        v68.onCanvasSizeChanged:Disconnect();
    end;
    if v68.onCanvasPositionChanged then
        v68.onCanvasPositionChanged:Disconnect();
    end;
    v68.preserveCanvasPosition = false;
end;
v25 = l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    ScriptConversionContext = v18
})(v25);
return v2.connect(function(v69, _) --[[ Line: 258 ]] --[[ Name: mapStateToProps ]]
    return {
        expansion = v69.ScriptConversion.expansion, 
        selection = v69.ScriptConversion.selection, 
        diagnostics = v69.ScriptConversion.diagnostics, 
        completedScripts = v69.ScriptConversion.completedScripts, 
        initialIssueCounts = v69.ScriptConversion.initialIssueCounts, 
        revertedScripts = v69.ScriptConversion.revertedScripts, 
        filter = v69.ScriptConversion.filter, 
        replaceRules = v69.ScriptConversion.replaceRules
    };
end, function(v71) --[[ Line: 271 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v5 (copy), v8 (copy), v7 (copy), v6 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
    return {
        OnScriptsReverted = function(v72) --[[ Line: 273 ]] --[[ Name: OnScriptsReverted ]]
            -- upvalues: v71 (copy), v9 (ref)
            v71(v9(v72));
        end, 
        SetReplaceProgress = function(v73) --[[ Line: 276 ]] --[[ Name: SetReplaceProgress ]]
            -- upvalues: v71 (copy), v5 (ref)
            v71(v5(v73));
        end, 
        SetProgressBarMessageKey = function(v74) --[[ Line: 279 ]] --[[ Name: SetProgressBarMessageKey ]]
            -- upvalues: v71 (copy), v8 (ref)
            v71(v8(v74));
        end, 
        SetScriptExpansion = function(v75) --[[ Line: 282 ]] --[[ Name: SetScriptExpansion ]]
            -- upvalues: v71 (copy), v7 (ref)
            v71(v7(v75));
        end, 
        SetScriptSelection = function(v76) --[[ Line: 285 ]] --[[ Name: SetScriptSelection ]]
            -- upvalues: v71 (copy), v6 (ref)
            v71(v6(v76));
        end, 
        ReplaceWithRules = function(v77, v78, v79) --[[ Line: 288 ]] --[[ Name: ReplaceWithRules ]]
            -- upvalues: v71 (copy), v10 (ref)
            v71(v10(v77, v78, false, v79));
        end, 
        ReplaceWithSuggestion = function(v80, v81, v82, v83, v84, v85, v86) --[[ Line: 291 ]] --[[ Name: ReplaceWithSuggestion ]]
            -- upvalues: v71 (copy), v11 (ref)
            v71(v11(v80, v81, v82, v83, v84, v85, true, v86));
        end, 
        RevertScripts = function(v87, v88, v89) --[[ Line: 296 ]] --[[ Name: RevertScripts ]]
            -- upvalues: v71 (copy), v12 (ref)
            v71(v12(v87, v88, v89));
        end, 
        UndoRevert = function(v90, v91, v92) --[[ Line: 299 ]] --[[ Name: UndoRevert ]]
            -- upvalues: v71 (copy), v13 (ref)
            v71(v13(v90, v91, v92));
        end
    };
end)(v25);
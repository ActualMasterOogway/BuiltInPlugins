local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
local v7 = require(l_script_FirstAncestor_0.Components.Contexts.VirtualizedListContext);
local v8 = require(l_script_FirstAncestor_0.Util.getExplorerNodeDepth);
local v9 = require(l_script_FirstAncestor_0.Util.mapValues);
local v10 = require(l_script_FirstAncestor_0.Util.profile);
local v11 = table.freeze({
    datum = table.freeze({
        id = v1.nilId, 
        name = "", 
        className = "Folder", 
        hasChildren = false
    }), 
    depth = 0, 
    isSelectedWithin = false, 
    yPixels = -1000
});
return v10(function(v12, v13, v14) --[[ Line: 53 ]] --[[ Name: useVisibleExplorerNodeRange ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy), v1 (copy), v2 (copy), v11 (copy), v8 (copy), v3 (copy), v9 (copy)
    local v15 = v4.useContext(v7.Context);
    local v16 = v4.useContext(v6.Context);
    local v17, v18 = v4.useState({});
    local v19 = math.ceil(v13 / v1.explorerRowHeight) + v15.extraNodes * 2;
    v4.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v12 (copy), v16 (copy), v14 (copy), v1 (ref), v15 (copy), v19 (copy), v2 (ref), v11 (ref), v8 (ref), v3 (ref), v18 (copy), v9 (ref)
        local function v51() --[[ Line: 66 ]] --[[ Name: getCurrentVisibleNodes ]]
            -- upvalues: v12 (ref), v16 (ref), v14 (ref), v1 (ref), v15 (ref), v19 (ref), v2 (ref), v11 (ref), v8 (ref)
            local v20 = v12.selectedIdsObservable.get();
            local v21 = v12.selectedWithinIdsObservable.get();
            local function v24(v22) --[[ Line: 70 ]] --[[ Name: getSelectionKind ]]
                -- upvalues: v20 (copy), v16 (ref)
                if v20[v22.datum.id] then
                    return "Selected";
                elseif not v16.getShowSelectionHierarchyHighlights() then
                    return nil;
                else
                    local l_parent_0 = v22.parent;
                    while true do
                        if l_parent_0 ~= nil then
                            if v20[l_parent_0.datum.id] then
                                return "ParentSelected";
                            else
                                l_parent_0 = l_parent_0.parent;
                            end;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
            local function _(v25) --[[ Line: 91 ]] --[[ Name: getIsSelectedWithin ]]
                -- upvalues: v21 (copy), v12 (ref)
                local v26 = false;
                if v21[v25.datum.id] == true then
                    v26 = v12.getExpandState(v25.datum.id) == "Collapsed";
                end;
                return v26;
            end;
            local l_children_0 = v12.focusedRootObservable.get().children;
            local v29 = v12.hoveredObservable.get();
            local v30 = v14.get();
            local v31 = {};
            local v32 = math.max(1, 1 + v30 // v1.explorerRowHeight - v15.extraNodes);
            for v33 = v32, v32 + v19 - 1 do
                local v34 = v2.getNthDescendant(l_children_0, v33);
                if v34 == nil then
                    table.insert(v31, v11);
                else
                    local v35 = v24(v34);
                    local v36 = {
                        datum = v34.datum, 
                        uiState = v34.uiState, 
                        depth = v8(v34), 
                        hoverState = if v29 ~= nil and v29.instanceId == v34.datum.id then v29.hoveredWithin and "HoveredWithin" or "Hovered" else nil, 
                        selectionState = v35 and {
                            kind = v35, 
                            segment = "Only"
                        }
                    };
                    local v37 = false;
                    if v21[v34.datum.id] == true then
                        v37 = v12.getExpandState(v34.datum.id) == "Collapsed";
                    end;
                    v36.isSelectedWithin = v37;
                    v36.yPixels = (v33 - 1) * v1.explorerRowHeight;
                    table.insert(v31, table.freeze(v36));
                end;
            end;
            local function _(v38) --[[ Line: 138 ]] --[[ Name: selectionKindOfIndex ]]
                -- upvalues: v2 (ref), l_children_0 (copy), v24 (copy)
                local v39 = v2.getNthDescendant(l_children_0, v38);
                if v39 == nil then
                    return nil;
                else
                    return (v24(v39));
                end;
            end;
            local v41;
            if v32 == 1 then
                v41 = false;
            else
                local v42 = v32 - 1;
                local v43 = v2.getNthDescendant(l_children_0, v42);
                v41 = (if v43 == nil then nil else v24(v43)) ~= nil;
            end;
            for v44, v45 in v31 do
                local v46 = v31[v44 + 1];
                if v45.selectionState == nil then
                    v41 = false;
                else
                    local v47;
                    if v44 == #v31 then
                        local v48 = v32 + v19;
                        local v49 = v2.getNthDescendant(l_children_0, v48);
                        v47 = if v49 == nil then nil else v24(v49);
                    else
                        v47 = false;
                        if v46 ~= nil then
                            v47 = v46.selectionState and v46.selectionState.kind;
                        end;
                    end;
                    local v50 = v47 ~= nil;
                    if v41 and v50 then
                        v45.selectionState.segment = "Middle";
                    elseif not v41 and v50 then
                        v45.selectionState.segment = "Top";
                    elseif v41 and not v50 then
                        v45.selectionState.segment = "Bottom";
                    end;
                    v41 = true;
                end;
            end;
            return v31;
        end;
        local v52 = v51();
        local v53 = {};
        local v54 = {};
        for v55, v56 in v52 do
            if v56.datum.id ~= v1.nilId then
                table.insert(v54, v56.datum.id);
            end;
            local v57, v58 = v3.create(v56);
            v53[v55] = {
                observable = v57, 
                set = v58
            };
        end;
        v12.setViewingInstances(v54);
        v18(v9(v53, function(v59) --[[ Line: 198 ]]
            return v59.observable;
        end));
        local function v64() --[[ Line: 202 ]] --[[ Name: updateObservables ]]
            -- upvalues: v51 (copy), v19 (ref), v1 (ref), v53 (copy), v12 (ref)
            local v60 = v51();
            assert(#v60 == v19, "Amount of visible nodes changed");
            local v61 = {};
            for v62, v63 in v60 do
                if v63.datum.id ~= v1.nilId then
                    table.insert(v61, v63.datum.id);
                end;
                v53[v62].set(v63);
            end;
            v12.setViewingInstances(v61);
        end;
        local v65 = {
            v12.hoveredObservable.changedSignal:Connect(v64), 
            v12.focusedRootObservable.changedSignal:Connect(v64), 
            v12.selectedIdsObservable.changedSignal:Connect(v64), 
            v12.selectedWithinIdsObservable.changedSignal:Connect(v64), 
            v14.changedSignal:Connect(v64)
        };
        return function() --[[ Line: 227 ]]
            -- upvalues: v65 (copy)
            for _, v67 in v65 do
                v67:Disconnect();
            end;
        end;
    end, {
        v19, 
        v14, 
        v12.hoveredObservable, 
        v12.focusedRootObservable, 
        v12.selectedIdsObservable, 
        v12.setViewingInstances
    });
    return v17;
end);
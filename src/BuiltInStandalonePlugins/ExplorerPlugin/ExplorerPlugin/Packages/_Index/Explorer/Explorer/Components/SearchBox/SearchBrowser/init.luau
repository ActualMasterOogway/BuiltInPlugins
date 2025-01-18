local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v4 = require(l_script_FirstAncestor_0.Util.Observable);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v7 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v8 = require(l_script_FirstAncestor_0.Util.localizeInt);
local v9 = require(l_script_FirstAncestor_0.Util.reduceList);
local l_createElement_0 = v5.createElement;
return function(v11) --[[ Line: 15 ]] --[[ Name: SearchBrowser ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy), v9 (copy), v1 (copy), v7 (copy), l_createElement_0 (copy), v8 (copy), v3 (copy)
    local v12 = v2.ContextServices.Localization:use();
    local v13 = v4.use(v11.session.searchResultCountObservable);
    local v28 = v5.useCallback(function(v14, v15) --[[ Line: 24 ]]
        -- upvalues: v11 (copy), v9 (ref), v13 (copy), v1 (ref)
        local v16 = v11.session.focusedRootObservable.get();
        assert(v16 ~= nil, "No search root when selecting next search node");
        local v17 = math.sign(v14);
        local v18 = v16.children and v16.children.treeDescendantCount - 1 or 0;
        local v19 = {
            closestSelectedVisibleIndex = v17 == 1 and 0 or v18 + 1, 
            selectedVisibleIds = {}, 
            selectedVisibleIdsArray = {}, 
            selectedResultCount = 0
        };
        local v20 = v11.session.selectedIdsArrayObservable.get();
        local v24 = v9(v20, function(v21, v22) --[[ Line: 47 ]]
            -- upvalues: v11 (ref), v17 (copy)
            local v23 = v11.session.getIndexOfInstanceId(v22);
            if v23 then
                v21.closestSelectedVisibleIndex = v17 * math.max(v17 * v21.closestSelectedVisibleIndex, v17 * v23);
                v21.selectedVisibleIds[v22] = true;
                table.insert(v21.selectedVisibleIdsArray, v22);
                if v11.session.isInstanceIdSearched(v22) then
                    v21.selectedResultCount = v21.selectedResultCount + 1;
                end;
            end;
            return v21;
        end, v19);
        if v24.selectedResultCount == v13 then
            return;
        else
            local v25 = (v24.closestSelectedVisibleIndex - 1 + v14) % v18;
            local v26 = v1.getNthDescendant(v16.children, v25 + 1);
            assert(v26 ~= nil, "Selected node not found in search root");
            local l_id_0 = v26.datum.id;
            while not v11.session.isInstanceIdSearched(l_id_0) or v24.selectedVisibleIds[l_id_0] do
                v25 = (v25 + v14) % v18;
                v26 = v1.getNthDescendant(v16.children, v25 + 1);
                assert(v26 ~= nil, "Selected node not found in search root");
                l_id_0 = v26.datum.id;
            end;
            if v15 then
                table.insert(v24.selectedVisibleIdsArray, l_id_0);
                v11.session.selectIds(table.freeze(v24.selectedVisibleIdsArray));
                return;
            else
                v11.session.selectIds(table.freeze({
                    l_id_0
                }));
                return;
            end;
        end;
    end, {
        v13, 
        v11.session.focusedRootObservable, 
        v11.session.selectedIdsArrayObservable, 
        v11.session.getIndexOfInstanceId, 
        v11.session.isInstanceIdSearched, 
        v11.session.selectIds
    });
    local v31 = v5.useCallback(function(_, v30) --[[ Line: 95 ]]
        -- upvalues: v28 (copy)
        v28(-1, v30:IsModifierKeyDown(Enum.ModifierKey.Ctrl));
    end, {
        v28
    });
    local v34 = v5.useCallback(function(_, v33) --[[ Line: 99 ]]
        -- upvalues: v28 (copy)
        v28(1, v33:IsModifierKeyDown(Enum.ModifierKey.Ctrl));
    end, {
        v28
    });
    local v35 = v5.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v11 (copy)
        v11.session.setSearch(v11.session.getSearch(), true);
    end, {
        v11.session.setSearch, 
        v11.session.getSearch
    });
    local v36 = v7();
    local v37 = v13 and "Explorer-Content-Standard" or "Explorer-Content-Muted";
    local v38 = v13 ~= nil;
    return l_createElement_0("Frame", {
        LayoutOrder = v11.layoutOrder, 
        [v5.Tag] = "X-RowS X-Middle Explorer-SidePadS Explorer-SearchBox-SearchBrowser data-testid=SearchBrowser"
    }, {
        ResultCount = l_createElement_0("TextLabel", {
            LayoutOrder = v36(), 
            Text = if v13 == 1 then v12:getText("SearchBrowser", "ResultCountSingular") else v12:getText("SearchBrowser", "ResultCountPlural_v2_1", {
                resultCount = v8(v13 or 0)
            }), 
            [v5.Tag] = "Explorer-FillX data-testid=SearchBrowser-ResultCountLabel"
        }), 
        FindPrevious = l_createElement_0("ImageButton", {
            Interactable = v38, 
            Image = v3.standard("findPrevious"), 
            LayoutOrder = v36(), 
            [v5.Event.Activated] = v31, 
            [v5.Tag] = ("Explorer-Icon %* data-testid=SearchBrowser-FindPreviousButton"):format(v37)
        }), 
        FindNext = l_createElement_0("ImageButton", {
            Interactable = v38, 
            Image = v3.standard("findNext"), 
            LayoutOrder = v36(), 
            [v5.Event.Activated] = v34, 
            [v5.Tag] = ("Explorer-Icon %* data-testid=SearchBrowser-FindNextButton"):format(v37)
        }), 
        SelectAll = l_createElement_0("ImageButton", {
            Interactable = v38, 
            Image = v3.standard("selectAll"), 
            LayoutOrder = v36(), 
            [v5.Event.Activated] = v11.session.selectAllSearchedIds, 
            [v5.Tag] = ("Explorer-Icon %* data-testid=SearchBrowser-SelectAllButton"):format(v37)
        }), 
        Refresh = l_createElement_0("ImageButton", {
            Interactable = v38, 
            Image = v3.standard("refresh"), 
            LayoutOrder = v36(), 
            [v5.Event.Activated] = v35, 
            [v5.Tag] = ("Explorer-Icon %* data-testid=SearchBrowser-RefreshButton"):format(v37)
        })
    });
end;
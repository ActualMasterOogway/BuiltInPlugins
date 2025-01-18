local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.ContextMenuContext);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v7 = require(l_script_FirstAncestor_0.Util.setVisibleExplorerNodeTags);
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local v9 = require(l_script_FirstAncestor_0.Components.Underlays.useExplorerNodeClicking);
local v10 = require(l_script_FirstAncestor_0.Hooks.useImperativeTagger);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v4.createElement;
return function(v13) --[[ Line: 17 ]] --[[ Name: UnderlaysRow ]]
    -- upvalues: v9 (copy), v4 (copy), v10 (copy), v7 (copy), v3 (copy), v2 (copy), v6 (copy), l_createElement_0 (copy), v1 (copy)
    local l_visibleNodeObservable_0 = v13.visibleNodeObservable;
    local v15 = v9(l_visibleNodeObservable_0, v13.session, v13.textLabelRef);
    local v16 = v4.useRef(nil);
    local v17 = v4.useRef(nil);
    local v18 = v10(v16);
    local v19 = v10(v17);
    local v21 = v4.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: l_visibleNodeObservable_0 (copy), v7 (ref), v13 (copy), v18 (copy), v19 (copy)
        local v20 = l_visibleNodeObservable_0.get();
        v7(v20, v13.draggingTargetObservable.get(), v18);
        v7(v20, v13.draggingTargetObservable.get(), v19);
    end, {
        l_visibleNodeObservable_0, 
        v13.draggingTargetObservable, 
        v18, 
        v19
    });
    v3.useEffect(l_visibleNodeObservable_0, v21, {
        v21
    });
    v3.useEffect(v13.draggingTargetObservable, v21, {
        v21
    });
    local v22 = v3.use(v13.session.selectedIdsObservable);
    local v23 = v4.useContext(v2.Context);
    local v26 = v4.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: l_visibleNodeObservable_0 (copy), v22 (copy), v13 (copy), v23 (copy)
        local l_id_0 = l_visibleNodeObservable_0.get().datum.id;
        if not v22[l_id_0] then
            v13.session.selectIds(table.freeze({
                l_id_0
            }));
        end;
        local v25 = v13.session.openContextMenuAsync();
        v23.showContextMenu(v25);
    end, {
        l_visibleNodeObservable_0, 
        v22, 
        v13.session.selectIds, 
        v13.session.openContextMenuAsync, 
        v13.session.performContextMenuAction, 
        v23.showContextMenu
    });
    local v29 = v4.useCallback(function(v27, v28) --[[ Line: 67 ]]
        -- upvalues: v15 (copy)
        if v28.UserInputState == Enum.UserInputState.Begin then
            v15.inputBegan(v27, v28);
        end;
    end, {
        v15.inputBegan
    });
    local v30 = v6();
    return l_createElement_0("TextButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Size = UDim2.new(1, 0, 0, v1.explorerRowHeight), 
        Text = "", 
        [v4.Event.InputBegan] = v15.inputBegan, 
        [v4.Event.InputChanged] = v29, 
        [v4.Event.MouseButton2Down] = v26, 
        [v4.Tag] = "Explorer-UnderlaysRow"
    }, {
        Background = l_createElement_0("Frame", {
            ZIndex = v30(), 
            ref = v16, 
            [v4.Tag] = "Explorer-UnderlaysRow-Background"
        }), 
        Border = l_createElement_0("Frame", {
            ZIndex = v30(), 
            ref = v17, 
            [v4.Tag] = "Explorer-UnderlaysRow-Border"
        })
    });
end;
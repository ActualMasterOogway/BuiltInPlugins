local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.DragDropContext);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
local v5 = require(l_script_FirstAncestor_0.Hooks.useRenameBoxActivity);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
return function(v7) --[[ Line: 10 ]] --[[ Name: useInsertObjectVisible ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v5 (copy), v2 (copy)
    local v8 = v3.useContext(v1.Context);
    local v9 = v3.useContext(v4.Context);
    local v10 = v5(v7);
    local v11 = v2.use(v9.windowHoveredObservable);
    local l_enabled_0 = v10.enabled;
    local l_selectionDragInProgress_0 = v8.selectionDragInProgress;
    return not l_enabled_0 and not l_selectionDragInProgress_0 and v11;
end;
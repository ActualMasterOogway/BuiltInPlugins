local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(script.DragDropIndicator);
local v2 = require(l_script_FirstAncestor_0.Components.NodeDecorators);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(script.OverlaysRow);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v7 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v5.createElement;
return (v5.memo(function(v11) --[[ Line: 15 ]] --[[ Name: Overlays ]]
    -- upvalues: v7 (copy), l_createElement_0 (copy), v2 (copy), v4 (copy), v1 (copy)
    local v12 = v7(1);
    return l_createElement_0(v2, {
        session = v11.session, 
        scrollHeightObservable = v11.scrollHeightObservable, 
        visibleNodeObservables = v11.visibleNodeObservables, 
        zIndex = v11.zIndex, 
        render = function(v13) --[[ Line: 31 ]] --[[ Name: render ]]
            -- upvalues: l_createElement_0 (ref), v4 (ref), v11 (copy)
            return l_createElement_0(v4, {
                session = v11.session, 
                scrollWidthObservable = v11.scrollWidthObservable, 
                visibleNodeObservable = v13
            });
        end
    }, {
        DragDropIndicator = l_createElement_0(v1, {
            draggingTargetObservable = v11.draggingTargetObservable, 
            scrollHeightObservable = v11.scrollHeightObservable, 
            scrollWidthObservable = v11.scrollWidthObservable, 
            visibleNodeObservables = v11.visibleNodeObservables, 
            session = v11.session, 
            zIndex = v12()
        })
    });
end));
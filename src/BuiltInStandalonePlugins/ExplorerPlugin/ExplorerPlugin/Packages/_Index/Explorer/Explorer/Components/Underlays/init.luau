local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.NodeDecorators);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(script.UnderlaysRow);
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v3.createElement;
return function(v9) --[[ Line: 17 ]] --[[ Name: Underlays ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy), v5 (copy)
    return l_createElement_0(v1, {
        session = v9.session, 
        scrollHeightObservable = v9.scrollHeightObservable, 
        visibleNodeObservables = v9.visibleNodeObservables, 
        zIndex = v9.zIndex, 
        render = function(v10, v11) --[[ Line: 31 ]] --[[ Name: render ]]
            -- upvalues: l_createElement_0 (ref), v5 (ref), v9 (copy)
            return l_createElement_0(v5, {
                session = v9.session, 
                visibleNodeObservable = v10, 
                draggingTargetObservable = v9.draggingTargetObservable, 
                textLabelRef = v9.textLabelRefs[v11]
            });
        end
    });
end;
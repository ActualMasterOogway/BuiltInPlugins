local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.RenameBox);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Util.joinAndMapBindings);
local v7 = require(l_script_FirstAncestor_0.Hooks.useRenameBoxActivity);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v3.createElement;
return function(v10) --[[ Line: 14 ]] --[[ Name: RenameBoxOverlay ]]
    -- upvalues: v7 (copy), v3 (copy), v6 (copy), v1 (copy), l_createElement_0 (copy), v4 (copy)
    local l_visibleNodeObservable_0 = v10.visibleNodeObservable;
    local v12 = v7(l_visibleNodeObservable_0);
    local v14 = v3.useCallback(function(v13) --[[ Line: 23 ]]
        -- upvalues: v10 (copy), l_visibleNodeObservable_0 (copy), v12 (copy)
        v10.session.renameInstance(l_visibleNodeObservable_0.get().datum.id, v13);
        v12.disable();
    end, {
        l_visibleNodeObservable_0, 
        v10.session.renameInstance, 
        v12.disable
    });
    if not v12.enabled then
        return nil;
    else
        local v17 = v6(function(v15, v16) --[[ Line: 35 ]]
            -- upvalues: v1 (ref)
            return (math.max(0, v1.indentWidth * v16.depth + v1.explorerRowHeight + v1.iconSize + 5 - v15));
        end, v10.scrollWidthObservable.getBinding(), v10.visibleNodeObservable.getBinding());
        return l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            Position = v17:map(function(v18) --[[ Line: 48 ]]
                return UDim2.fromOffset(v18, 0);
            end), 
            Size = v17:map(function(v19) --[[ Line: 51 ]]
                return UDim2.new(1, -v19, 1, 0);
            end), 
            [v3.Tag] = "data-testid=Overlays-RenameBoxOverlay"
        }, {
            RenameBox = l_createElement_0(v4, {
                initialText = l_visibleNodeObservable_0.get().datum.name, 
                onRenameComplete = v14, 
                onCancel = v12.disable
            })
        });
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_createElement_0 = v3.createElement;
return function(v6) --[[ Line: 12 ]] --[[ Name: StudioDragDropContextProvider ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy), l_createElement_0 (copy)
    local v7 = v2.ContextServices.Plugin:use():get();
    local v8 = v4.useToggleState();
    local v9 = v3.useCallback(function() --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7:StartDrag({
            Sender = "Explorer", 
            MimeType = "roblox/selection"
        });
        v8.enable();
    end, {
        v7
    });
    v4.useEventConnection(v6.dockWidget.PluginDragEntered, function(v10) --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        if v10.MimeType ~= "roblox/selection" then
            return;
        else
            v8.enable();
            return;
        end;
    end, {});
    v4.useEventConnection(v6.dockWidget.PluginDragLeft, function(v11) --[[ Line: 37 ]]
        -- upvalues: v8 (copy)
        if v11.MimeType ~= "roblox/selection" then
            return;
        else
            v8.disable();
            return;
        end;
    end, {});
    local v12 = v3.useRef(v1.Signal.new());
    v4.useEventConnection(v6.dockWidget.PluginDragDropped, function(v13) --[[ Line: 47 ]]
        -- upvalues: v8 (copy), v12 (copy)
        if v13.MimeType ~= "roblox/selection" then
            return;
        else
            v8.disable();
            v12.current:Fire();
            return;
        end;
    end, {});
    v4.useEventConnection(v6.dockWidget.PluginDragMoved, function(v14) --[[ Line: 56 ]]
        if v14.MimeType ~= "roblox/selection" then
            return;
        else
            return;
        end;
    end, {});
    return l_createElement_0(v1.Components.Contexts.DragDropContextProvider, {
        startSelectionDrag = v9, 
        selectionDragInProgress = v8.enabled, 
        selectionDragDropped = v12.current
    }, v6.children);
end;
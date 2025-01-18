local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Src.SharedFeatures.StudioSelectAll);
local v3 = require(l_script_FirstAncestor_0.Src.SharedFeatures.StudioWindowInput);
local v4 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.createContextMenuActionWatcher);
local v5 = require(l_script_FirstAncestor_0.Src.Guest.createStudioGuestConnection);
local v6 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.createStudioGuestContextMenuActions);
local v7 = require(l_script_FirstAncestor_0.Src.Guest.createStudioInstancePicker);
local v8 = require(l_script_FirstAncestor_0.Src.Guest.isServiceVisible);
local v9 = require(l_script_FirstAncestor_0.Src.Guest.listenForFocus);
local v10 = require(l_script_FirstAncestor_0.Src.Guest.listenForVisibilityChanges);
local v11 = require(l_script_FirstAncestor_0.Src.Guest.openInsertObjectMenu);
local v12 = require(l_script_FirstAncestor_0.Src.Guest.openScript);
local v13 = require(l_script_FirstAncestor_0.Src.Guest.triggerFocus);
return function(v14) --[[ Line: 18 ]] --[[ Name: startStudioGuest ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v5 (copy), v7 (copy), v1 (copy), v6 (copy), v11 (copy), v10 (copy), v8 (copy), v12 (copy), v13 (copy), v9 (copy)
    local v15 = v4(v14);
    local v16 = v2.connectGuest(v14);
    local v17 = v3.connectGuest();
    local v18, v19 = v5(v14);
    local v20, v21 = v7(v14);
    local v25 = v1.Guest.startGuest({
        guestConnectionObservable = v18, 
        createGuestRpcInterface = function(v22) --[[ Line: 29 ]] --[[ Name: createGuestRpcInterface ]]
            -- upvalues: v1 (ref), v6 (ref), v14 (copy), v15 (copy), v11 (ref), v10 (ref), v20 (copy), v8 (ref), v12 (ref), v13 (ref), v9 (ref)
            return v1.Guest.InstanceGuestRPCInterface.createInstanceGuestRPCInterface(game, v22, v6(v14, v15), {
                openInsertObjectMenu = function(v23, v24) --[[ Line: 35 ]] --[[ Name: openInsertObjectMenu ]]
                    -- upvalues: v11 (ref), v14 (ref)
                    v11(v14, v23, v24);
                end, 
                listenForVisibilityChanges = v10, 
                instancePicker = v20, 
                isServiceVisible = v8, 
                openScript = v12, 
                triggerFocus = function() --[[ Line: 43 ]] --[[ Name: triggerFocus ]]
                    -- upvalues: v13 (ref), v14 (ref)
                    v13(v14);
                end, 
                listenForFocus = v9
            });
        end
    });
    v14.Unloading:Connect(function() --[[ Line: 52 ]]
        -- upvalues: v25 (copy), v19 (copy), v21 (copy), v16 (copy), v17 (copy), v15 (copy)
        v25();
        v19();
        v21();
        v16();
        v17();
        v15.destroy();
    end);
end;
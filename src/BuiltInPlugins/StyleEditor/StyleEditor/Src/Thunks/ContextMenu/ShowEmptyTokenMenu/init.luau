local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.PasteStyleInstanceAttribute);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v8) --[[ Line: 24 ]] --[[ Name: ShowEmptyTokenMenu ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy)
    return function(v9, v10) --[[ Line: 25 ]]
        -- upvalues: v3 (ref), v5 (ref), v8 (copy), v2 (ref)
        local v11 = v9:getState();
        local l_Localization_0 = v10.Localization;
        local v13 = v11.Clipboard.Attribute ~= nil;
        local v15 = {
            {
                Id = "Paste", 
                Text = l_Localization_0:getText("ContextMenu", "Paste"), 
                Enabled = v13, 
                Icon = v3.paste(), 
                OnItemClicked = function(_) --[[ Line: 37 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v9 (copy), v5 (ref), v8 (ref)
                    v9:dispatch(v5(v8));
                end
            }
        };
        local v16 = {
            Id = "Token_Empty", 
            Children = v15
        };
        v2.trackClicks(v16, v10.Telemetry);
        v2.showContextMenu(v10.Plugin, v16);
    end;
end;
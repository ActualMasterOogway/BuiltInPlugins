local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Util.TokenHelpers);
local v4 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Clipboard.CopyAttributeToClipboard);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v8 = require(l_Thunks_0.Change.DuplicateAttribute);
local v9 = require(l_Thunks_0.Change.PasteStyleInstanceAttribute);
local v10 = require(l_Thunks_0.Change.SetStyleSheetTokenType);
local v11 = require(l_Thunks_0.Change.SetStyleInstanceAttribute);
local v12 = require(l_Thunks_0.Change.UnlinkStyleSheetAttributeTokenReference);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
local function _(v15, v16) --[[ Line: 32 ]] --[[ Name: isTokenReference ]]
    -- upvalues: v3 (copy)
    local l_v15_Attribute_0 = v15:GetAttribute(v16);
    return v3.parseAttributeName(l_v15_Attribute_0) ~= nil;
end;
return function(v19, v20) --[[ Line: 39 ]] --[[ Name: ShowTokenMenu ]]
    -- upvalues: v2 (copy), v10 (copy), v3 (copy), v4 (copy), v12 (copy), v6 (copy), v9 (copy), v8 (copy), v11 (copy)
    return function(v21, v22) --[[ Line: 40 ]]
        -- upvalues: v19 (copy), v20 (copy), v2 (ref), v10 (ref), v3 (ref), v4 (ref), v12 (ref), v6 (ref), v9 (ref), v8 (ref), v11 (ref)
        local v23 = v21:getState();
        local l_Localization_0 = v22.Localization;
        local l_v19_Attribute_0 = v19:GetAttribute(v20);
        local v28 = v2.getAttributeTypeActions(v2.AttributeTypes, function(v26) --[[ Line: 48 ]]
            -- upvalues: v21 (copy), v10 (ref), v19 (ref), v20 (ref)
            local v27 = if v26.Data then v26.Data.Type else nil;
            if not v27 then
                warn("Cannot change to nil type");
                return;
            else
                v21:dispatch(v10(v19, v20, v27));
                return;
            end;
        end);
        local v29 = v23.Clipboard.Attribute ~= nil;
        local l_v19_Attribute_1 = v19:GetAttribute(v20);
        local v31 = v3.parseAttributeName(l_v19_Attribute_1) ~= nil;
        local v33 = {
            Id = "UnlinkToken", 
            Text = l_Localization_0:getText("ContextMenu", "UnlinkToken"), 
            Icon = v4.Standard.TokenSheet(), 
            OnItemClicked = function(_) --[[ Line: 66 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v21 (copy), v12 (ref), v19 (ref), v20 (ref)
                v21:dispatch(v12(v19, v20));
            end
        };
        local v35 = {
            Id = "LinkToken", 
            Text = l_Localization_0:getText("ContextMenu", "LinkToken"), 
            Icon = v4.Standard.TokenSheet(), 
            OnItemClicked = function(_) --[[ Line: 75 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v21 (copy), v10 (ref), v19 (ref), v20 (ref)
                v21:dispatch(v10(v19, v20, "TokenReference"));
            end
        };
        l_v19_Attribute_1 = {
            {
                Id = "ChangeType", 
                Text = l_Localization_0:getText("ContextMenu", "ChangeType"), 
                Children = v28
            }, 
            if v31 then v33 else v35, 
            {
                Id = "Copy", 
                Text = l_Localization_0:getText("ContextMenu", "Copy"), 
                Icon = v4.copy(), 
                OnItemClicked = function(_) --[[ Line: 91 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v21 (copy), v6 (ref), v20 (ref), l_v19_Attribute_0 (copy)
                    v21:dispatch(v6(v20, l_v19_Attribute_0));
                end
            }, 
            {
                Id = "Paste", 
                Text = l_Localization_0:getText("ContextMenu", "Paste"), 
                Enabled = v29, 
                Icon = v4.paste(), 
                OnItemClicked = function(_) --[[ Line: 100 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v21 (copy), v9 (ref), v19 (ref)
                    v21:dispatch(v9(v19));
                end
            }, 
            {
                Id = "Duplicate", 
                Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                Icon = v4.duplicate(), 
                OnItemClicked = function(_) --[[ Line: 108 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v21 (copy), v8 (ref), v19 (ref), v20 (ref)
                    v21:dispatch(v8(v19, v20));
                end
            }, 
            {
                Id = "Delete", 
                Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                Icon = v4.delete(), 
                OnItemClicked = function(_) --[[ Line: 116 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v21 (copy), v11 (ref), v19 (ref), v20 (ref)
                    v21:dispatch(v11(v19, v20, nil));
                end
            }
        };
        local v40 = {
            Id = "Token", 
            Children = l_v19_Attribute_1
        };
        v2.trackClicks(v40, v22.Telemetry);
        v2.showContextMenu(v22.Plugin, v40);
    end;
end;
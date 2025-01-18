local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_useDialogWidget_0 = v2.UI.Hooks.useDialogWidget;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v7 = require(l_Components_0.CancelButton);
local v8 = require(l_Components_0.ThumbnailAndTextInfo);
local l_Attribute_0 = require(script.styles):GetAttribute("MinimumDialogSize");
local v10 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagFixCancellableDialogResizing();
return function(v11) --[[ Line: 30 ]] --[[ Name: DialogContainer ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v1 (copy), l_useDialogWidget_0 (copy), v10 (copy), l_Attribute_0 (copy), v8 (copy), v7 (copy)
    local v12 = l_LayoutOrderIterator_0.new();
    local v13 = l_Localization_0:use();
    local v14, v15 = v1.useState(false);
    local v16, v17 = v1.useState(0);
    local v18, v19, v20 = l_useDialogWidget_0({
        Size = if v10 then Vector2.new(math.max(v16, l_Attribute_0.X), l_Attribute_0.Y) else Vector2.new(400, 130), 
        Modal = true, 
        Title = v13:getText("Plugin", "Title"), 
        OnClosed = function() --[[ Line: 43 ]] --[[ Name: OnClosed ]]
            -- upvalues: v11 (copy)
            print("CancellableDialog::DialogContainer::OnClosed - Dialog closed via X button in title bar");
            v11.OnCancel();
        end, 
        DisableTitleBar = true, 
        Contents = v1.createElement("Frame", {
            [v1.Tag] = "X-FitY X-Column Component-DialogContainer"
        }, {
            ThumbnailAndTextInfo = v1.createElement(v8, {
                LayoutOrder = v12:getNextOrder(), 
                Title = v11.Title, 
                Subtitle = v11.Subtitle, 
                Status = v11.Status, 
                Image = v11.Image, 
                OnWidthChanged = v17, 
                OnShown = function() --[[ Line: 58 ]] --[[ Name: OnShown ]]
                    -- upvalues: v15 (copy)
                    v15(true);
                end
            }), 
            CancelButton = v1.createElement(v7, {
                LayoutOrder = v12:getNextOrder(), 
                Enabled = v11.CancelButtonEnabled, 
                OnCancel = v11.OnCancel
            })
        })
    });
    v1.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v14 (copy), v11 (copy)
        if v14 then
            v11.OnDialogShown();
        end;
    end, {
        v14
    });
    v1.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v11 (copy), v20 (copy), v18 (copy), v19 (copy), v15 (copy)
        if v11.Enabled and not v20 then
            v18();
            return;
        else
            if not v11.Enabled and v20 then
                v19();
                v15(false);
            end;
            return;
        end;
    end, {
        v11.Enabled, 
        v20
    });
    return nil;
end;
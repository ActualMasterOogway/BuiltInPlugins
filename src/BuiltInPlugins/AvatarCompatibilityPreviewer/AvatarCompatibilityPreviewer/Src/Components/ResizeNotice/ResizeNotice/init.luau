local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useResizeAvatarHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
return function(v8) --[[ Line: 16 ]] --[[ Name: ResizeNotice ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), v3 (copy), v1 (copy)
    local v9 = v2.ContextServices.Localization:use();
    local v10 = v2.ContextServices.Stylizer:use("ResizeNotice");
    local v11 = v6(v8.Avatar);
    local v12 = v7(true);
    v3.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy)
        v12.enable();
    end, {
        v8.Avatar.WorldModel
    });
    local v13 = nil;
    local v14 = nil;
    if v11.autoSetupScaleErrorList then
        v13 = v9:getText("ResizeNotice", "TitleError");
        v14 = v9:getText("ResizeNotice", "DescriptionError", {
            resizePercent = if v11.autoSetupResizeProportion then v11.autoSetupResizeProportion * 100 else 100
        });
        for _, v16 in v11.autoSetupScaleErrorList do
            if v16 == v1.ERROR_NO_VALID_SCALE_ERROR then
                v16 = v9:getText("ResizeNotice", "NoValidScaleError");
            end;
            v14 = v14 .. " " .. v16;
            if not string.match(v16, "%p%s*$") then
                v14 = v14 .. ".";
            end;
        end;
    else
        v13 = v9:getText("ResizeNotice", "Title");
        v14 = v9:getText("ResizeNotice", "Description", {
            resizePercent = if v11.autoSetupResizeProportion then v11.autoSetupResizeProportion * 100 else 100
        });
    end;
    return v3.createElement(v2.UI.Pane, {
        Size = v10.Size, 
        Position = v10.Position, 
        AnchorPoint = v10.AnchorPoint, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Visible = v12.enabled and v11.autoSetupOriginalScale ~= nil and v11.autoSetupOriginalScale ~= 1 and v8.Avatar.WorldModelScale == 1
    }, {
        Alert = v3.createElement(v2.UI.Alert, {
            Title = v13, 
            Description = v14, 
            PrimaryAction = {
                Text = v9:getText("ResizeNotice", "RevertAction"), 
                OnClick = v11.revertScale
            }, 
            OnClose = v12.disable, 
            Style = v11.autoSetupScaleErrorList and "Info" or "Success"
        })
    });
end;
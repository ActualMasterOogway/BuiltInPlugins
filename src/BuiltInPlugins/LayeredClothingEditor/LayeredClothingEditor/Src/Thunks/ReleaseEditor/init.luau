local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_PreviewConstants_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewConstants;
local v3 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v4 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v5 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v6 = require(l_Parent_0.Src.Actions.SetToolMode);
local v7 = require(l_Parent_0.Src.Actions.SetEditingCage);
local v8 = require(l_Parent_0.Src.Util.Constants);
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function() --[[ Line: 19 ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), l_Selection_0 (copy), v7 (copy), v5 (copy), l_PreviewConstants_0 (copy), v6 (copy), v8 (copy), l_ChangeHistoryService_0 (copy)
    return function(v11) --[[ Line: 20 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (ref), l_Selection_0 (ref), v7 (ref), v5 (ref), l_PreviewConstants_0 (ref), v6 (ref), v8 (ref), l_ChangeHistoryService_0 (ref)
        v11:dispatch(v3(v1.None));
        v11:dispatch(v4({
            ItemCFrame = CFrame.new(), 
            AttachmentCFrame = CFrame.new()
        }));
        l_Selection_0:Set({});
        v11:dispatch(v7(v1.None));
        v11:dispatch(v5(l_PreviewConstants_0.TABS_KEYS.None));
        v11:dispatch(v6(v8.TOOL_MODE.None));
        l_ChangeHistoryService_0:SetEnabled(true);
    end;
end;
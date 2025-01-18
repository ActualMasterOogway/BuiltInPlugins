local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useOperation);
local v12 = require(l_script_FirstAncestor_0.Src.Util.FormatTimeRemaining);
local l_DialogOption_0 = require(l_script_FirstAncestor_0.Src.Types).DialogOption;
return function(v14) --[[ Line: 25 ]] --[[ Name: ProgressDialog ]]
    -- upvalues: l_Stylizer_0 (copy), l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), l_DialogOption_0 (copy), v1 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LoadingBar_0 (copy), v12 (copy)
    local v15 = l_Stylizer_0:use("ProgressDialog");
    local v16 = l_Localization_0:use();
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = {};
    if v14.OnPause and v14.OnResume then
        if v14.Paused then
            table.insert(v18, {
                Key = l_DialogOption_0.Resume, 
                Text = v16:getText("Dialog", l_DialogOption_0.Resume)
            });
        else
            table.insert(v18, {
                Key = l_DialogOption_0.Pause, 
                Text = v16:getText("Dialog", l_DialogOption_0.Pause)
            });
        end;
    end;
    if v14.OnCancel then
        table.insert(v18, {
            Key = l_DialogOption_0.Cancel, 
            Text = v16:getText("Dialog", l_DialogOption_0.Cancel)
        });
    end;
    return v1.createElement(l_StyledDialog_0, {
        Enabled = v14.Enabled, 
        Modal = false, 
        Title = v14.Title, 
        MinContentSize = v15.MinContentSize, 
        Buttons = v18, 
        OnButtonPressed = function(v19) --[[ Line: 57 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: l_DialogOption_0 (ref), v14 (copy)
            if v19 == l_DialogOption_0.Pause and v14.OnPause then
                v14.OnPause();
                return;
            elseif v19 == l_DialogOption_0.Resume and v14.OnResume then
                v14.OnResume();
                return;
            else
                if v19 == l_DialogOption_0.Cancel and v14.OnCancel then
                    v14.OnCancel();
                end;
                return;
            end;
        end, 
        OnClose = v14.OnClose
    }, {
        Contents = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Padding = v15.Padding, 
            Size = UDim2.fromScale(1, 1), 
            Spacing = v15.Spacing
        }, {
            Description = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v17:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, v15.DescriptionHeight), 
                Text = v14.Description
            }), 
            Progress = v1.createElement(l_LoadingBar_0, {
                LayoutOrder = v17:getNextOrder(), 
                Progress = v14.Progress, 
                Size = UDim2.new(1, 0, 0, v15.ProgressHeight)
            }), 
            Time = if v14.TimeRemaining then v1.createElement(l_TextLabel_0, {
                LayoutOrder = v17:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, v15.DescriptionHeight), 
                Text = v16:getText("Dialog", "TimeRemaining", {
                    Time = v12(v14.TimeRemaining, v16)
                })
            }) else nil
        })
    });
end;
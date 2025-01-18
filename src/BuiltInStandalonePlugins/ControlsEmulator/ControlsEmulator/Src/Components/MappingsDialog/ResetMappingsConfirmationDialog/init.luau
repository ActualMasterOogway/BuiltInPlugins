local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local v4 = v2.Util.LayoutOrderIterator.new();
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
return v1.memo(function(v6) --[[ Line: 20 ]] --[[ Name: MappingsDialog ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v5 (copy), v4 (copy)
    local v7 = l_Localization_0:use();
    local l_restoreDefaults_0 = v1.useContext(v5).restoreDefaults;
    return v1.createElement("TextButton", {
        [v1.Tag] = "Component-ResetMappingsConfirmationDialog CX-Invisible X-Fill", 
        Active = true, 
        LayoutOrder = v4:getNextOrder(), 
        Text = "", 
        [v1.Event.Activated] = v6.hideConfirmationDialog
    }, {
        v1.createElement("Frame", {
            Name = "DialogContents", 
            LayoutOrder = v4:getNextOrder()
        }, {
            ConfirmationText = v1.createElement("TextLabel", {
                Name = "ConfirmationText", 
                Text = v7:getText("ResetMappingsConfirmationDialog", "RestoreDefaultsConfirmation"), 
                LayoutOrder = v4:getNextOrder()
            }), 
            Buttons = v1.createElement("Frame", {
                Name = "ButtonsContainer", 
                LayoutOrder = v4:getNextOrder()
            }, {
                YesButton = v1.createElement("TextButton", {
                    [v1.Tag] = "Button", 
                    Text = v7:getText("ResetMappingsConfirmationDialog", "Yes"), 
                    LayoutOrder = v4:getNextOrder(), 
                    [v1.Event.Activated] = function() --[[ Line: 49 ]]
                        -- upvalues: v6 (copy), l_restoreDefaults_0 (copy)
                        v6.hideConfirmationDialog();
                        if l_restoreDefaults_0 ~= nil then
                            l_restoreDefaults_0();
                        end;
                    end
                }), 
                NoButton = v1.createElement("TextButton", {
                    [v1.Tag] = "Button", 
                    Text = v7:getText("ResetMappingsConfirmationDialog", "No"), 
                    LayoutOrder = v4:getNextOrder(), 
                    [v1.Event.Activated] = v6.hideConfirmationDialog
                })
            })
        })
    });
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local l_getFFlagDevFrameworkStyledDialogCancelAccept_0 = v1.SharedFlags.getFFlagDevFrameworkStyledDialogCancelAccept;
return function(v5) --[[ Line: 9 ]] --[[ Name: createDisambiguationMenuTestHelpers ]]
    -- upvalues: v2 (copy), v3 (copy), l_getFFlagDevFrameworkStyledDialogCancelAccept_0 (copy)
    local v6 = {
        isOpen = function() --[[ Line: 12 ]] --[[ Name: isOpen ]]
            -- upvalues: v5 (copy)
            return v5.subWindows()[1];
        end, 
        getSubWindow = function() --[[ Line: 16 ]] --[[ Name: getSubWindow ]]
            -- upvalues: v5 (copy)
            return v5.getSubWindow(1);
        end
    };
    v6.getEntry = function(v7) --[[ Line: 20 ]] --[[ Name: getEntry ]]
        -- upvalues: v6 (copy)
        return v6.getSubWindow().SolidBackground.Contents.Contents.Contents.Scroller[v7];
    end;
    v6.getWarningText = function(v8) --[[ Line: 24 ]] --[[ Name: getWarningText ]]
        -- upvalues: v6 (copy)
        local l_Warning_0 = v6.getEntry(v8).ItemNames:FindFirstChild("Warning");
        return l_Warning_0 and l_Warning_0.Text;
    end;
    v6.openDropdown = function(v10) --[[ Line: 35 ]] --[[ Name: openDropdown ]]
        -- upvalues: v2 (ref), v3 (ref), v6 (copy)
        local l_SelectInput_0 = v10.SelectInput;
        v2.act(function() --[[ Line: 38 ]]
            -- upvalues: v3 (ref), l_SelectInput_0 (copy)
            v3.Element.new(l_SelectInput_0):click();
        end);
        local l_Container_0 = v6.getSubWindow().TopLevelDetector.ScrollBlocker.Menu.Contents.Container;
        local v13 = {};
        for _, v15 in l_Container_0:GetChildren() do
            if v15:IsA("Frame") then
                local l_TextButton_0 = v15.Contents.TextButton;
                v13[tonumber(v15.Name)] = {
                    label = l_TextButton_0.Label.Text, 
                    click = function() --[[ Line: 55 ]] --[[ Name: click ]]
                        -- upvalues: l_Container_0 (copy), v15 (copy), v2 (ref), v3 (ref), l_TextButton_0 (copy)
                        for _, v18 in l_Container_0:GetChildren() do
                            if v18 ~= v15 and v18:IsA("Frame") then
                                v18.Visible = false;
                            end;
                        end;
                        v2.act(function() --[[ Line: 64 ]]
                            -- upvalues: v3 (ref), l_TextButton_0 (ref)
                            v3.Element.new(l_TextButton_0):click();
                        end);
                    end
                };
            end;
        end;
        return v13;
    end;
    v6.clickMatchingDropdownEntry = function(v19, v20) --[[ Line: 74 ]] --[[ Name: clickMatchingDropdownEntry ]]
        for _, v22 in v19 do
            if v22.label:match(v20) then
                v22.click();
                return;
            end;
        end;
        local v23 = {
            ("Couldn't find dropdown entry that matched pattern \"%*\""):format(v20), 
            "Found the following labels:"
        };
        for _, v25 in v19 do
            table.insert(v23, (("- %*"):format(v25.label)));
        end;
        error(table.concat(v23, "\n"));
    end;
    v6.openAmbiguousAssetTypeDropdown = function(v26) --[[ Line: 97 ]] --[[ Name: openAmbiguousAssetTypeDropdown ]]
        -- upvalues: v6 (copy)
        return v6.openDropdown(v26.Children.Dropdown.DropdownMenu);
    end;
    v6.openLoneMeshPartAssetTypeDropdown = function(v27) --[[ Line: 101 ]] --[[ Name: openLoneMeshPartAssetTypeDropdown ]]
        -- upvalues: v6 (copy)
        return v6.openDropdown(v27.Children.Children.AssetTypeDropdown);
    end;
    v6.attachmentDropdownExists = function(v28) --[[ Line: 105 ]] --[[ Name: attachmentDropdownExists ]]
        return v28.Children.Children:FindFirstChild("AttachmentDropdown") ~= nil;
    end;
    v6.openAttachmentDropdown = function(v29) --[[ Line: 109 ]] --[[ Name: openAttachmentDropdown ]]
        -- upvalues: v6 (copy)
        return v6.openDropdown(v29.Children.Children.AttachmentDropdown);
    end;
    v6.clickOk = function() --[[ Line: 113 ]] --[[ Name: clickOk ]]
        -- upvalues: v2 (ref), v5 (copy), v6 (copy), l_getFFlagDevFrameworkStyledDialogCancelAccept_0 (ref)
        v2.act(function() --[[ Line: 114 ]]
            -- upvalues: v5 (ref), v6 (ref), l_getFFlagDevFrameworkStyledDialogCancelAccept_0 (ref)
            v5.clickStyledDialogButton(v6.getSubWindow(), l_getFFlagDevFrameworkStyledDialogCancelAccept_0() and 2 or 1);
        end);
    end;
    return v6;
end;
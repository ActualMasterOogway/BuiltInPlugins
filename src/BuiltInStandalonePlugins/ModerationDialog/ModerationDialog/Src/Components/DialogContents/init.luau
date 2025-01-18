local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_TextWithLinks_0 = v2.UI.TextWithLinks;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v7 = require(l_Components_0.Checkbox);
local v8 = require(l_Components_0.Reason);
local v9 = require(l_Components_0.ReviewedNote);
local v10 = require(l_Components_0.ReactivateDateNote);
local v11 = require(l_script_FirstAncestor_0.Src.Util.AbuseTypeToString);
local l_BrowserService_0 = game:GetService("BrowserService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v14 = game:DefineFastString("ModerationDialogToULink", "https://en.help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use");
local v15 = game:DefineFastString("ModerationDialogCommunityGuidelinesLink", "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards");
local v16 = {
    Font = Enum.Font.SourceSans, 
    TextSize = 16, 
    TextXAlignment = Enum.TextXAlignment.Left
};
local function _(v17, v18, v19) --[[ Line: 37 ]] --[[ Name: createHyperlinkComponent ]]
    -- upvalues: v1 (copy), l_TextWithLinks_0 (copy), v16 (copy)
    return v1.createElement(l_TextWithLinks_0, {
        TextWrapped = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Text = v18, 
        TextProps = v16, 
        LinkMap = v19, 
        LayoutOrder = v17, 
        [v1.Tag] = "X-FitY"
    });
end;
return function(v21) --[[ Line: 59 ]] --[[ Name: DialogContents ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy), l_BrowserService_0 (copy), v14 (copy), l_TextWithLinks_0 (copy), v16 (copy), v9 (copy), v8 (copy), v11 (copy), v15 (copy), v10 (copy), l_ContentProvider_0 (copy), v7 (copy)
    local v22 = l_Localization_0:use();
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = {};
    local l_createElement_0 = v1.createElement;
    local v26 = "Frame";
    local v27 = {
        LayoutOrder = v23:getNextOrder(), 
        [v1.Tag] = "X-Fill X-Column Component-DialogContents"
    };
    local v28 = {};
    local v29 = v23:getNextOrder();
    local v30 = v22:getText("WarningHeader", "WarningLink");
    local v31 = {
        ["[link1]"] = {
            LinkText = v22:getText("Links", "ToULink"), 
            LinkCallback = function() --[[ Line: 74 ]] --[[ Name: LinkCallback ]]
                -- upvalues: l_BrowserService_0 (ref), v14 (ref)
                l_BrowserService_0:OpenBrowserWindow(v14);
            end
        }
    };
    v28.Body = v1.createElement(l_TextWithLinks_0, {
        TextWrapped = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Text = v30, 
        TextProps = v16, 
        LinkMap = v31, 
        LayoutOrder = v29, 
        [v1.Tag] = "X-FitY"
    });
    v28.ReviewedNote = v1.createElement(v9, {
        ReviewDateTime = v21.ReviewDateTime, 
        ModeratorNote = v21.ModeratorNote, 
        LayoutOrder = v23:getNextOrder()
    });
    v28.Separator1 = v1.createElement("Frame", {
        LayoutOrder = v23:getNextOrder(), 
        [v1.Tag] = "Separator"
    });
    v28.Reason = v21.Reason and v1.createElement(v8, {
        Reason = v11(v22, v21.Reason.abuseType), 
        OffensiveItem = v21.Reason.utteranceText, 
        LayoutOrder = v23:getNextOrder()
    });
    v28.Separator2 = v21.Reason and v1.createElement("Frame", {
        LayoutOrder = v23:getNextOrder(), 
        [v1.Tag] = "Separator"
    });
    v29 = v23:getNextOrder();
    v30 = v22:getText("AccountDisabled", "Guidelines");
    v31 = {
        ["[link1]"] = {
            LinkText = v22:getText("Links", "GuidelinesLink"), 
            LinkCallback = function() --[[ Line: 104 ]] --[[ Name: LinkCallback ]]
                -- upvalues: l_BrowserService_0 (ref), v15 (ref)
                l_BrowserService_0:OpenBrowserWindow(v15);
            end
        }
    };
    v28.Guidelines = v1.createElement(l_TextWithLinks_0, {
        TextWrapped = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Text = v30, 
        TextProps = v16, 
        LinkMap = v31, 
        LayoutOrder = v29, 
        [v1.Tag] = "X-FitY"
    });
    local v32 = false;
    if v21.Type ~= "Warn" then
        v32 = v1.createElement(v10, {
            BannedDateTime = v21.BannedDateTime, 
            LayoutOrder = v23:getNextOrder()
        });
    end;
    v28.ReactivateDateNote = v32;
    v29 = v23:getNextOrder();
    v30 = v22:getText("AccountDisabled", "Appeal");
    v31 = {
        ["[link1]"] = {
            LinkText = v22:getText("Links", "AppealPortal"), 
            LinkCallback = function() --[[ Line: 120 ]] --[[ Name: LinkCallback ]]
                -- upvalues: l_ContentProvider_0 (ref), l_BrowserService_0 (ref)
                local v33 = l_ContentProvider_0.BaseUrl .. "report-appeals?t_source=studio-nap";
                l_BrowserService_0:OpenBrowserWindow(v33);
            end
        }
    };
    v28.AppealPortal = v1.createElement(l_TextWithLinks_0, {
        TextWrapped = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Text = v30, 
        TextProps = v16, 
        LinkMap = v31, 
        LayoutOrder = v29, 
        [v1.Tag] = "X-FitY"
    });
    v32 = false;
    if v21.Type == "Warn" then
        v29 = v23:getNextOrder();
        v30 = v22:getText("Agreement", "TermsOfUse");
        v31 = {
            ["[link1]"] = {
                LinkText = v22:getText("Links", "ToULink"), 
                LinkCallback = function() --[[ Line: 133 ]] --[[ Name: LinkCallback ]]
                    -- upvalues: l_BrowserService_0 (ref), v14 (ref)
                    l_BrowserService_0:OpenBrowserWindow(v14);
                end
            }
        };
        v32 = v1.createElement(l_TextWithLinks_0, {
            TextWrapped = true, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Text = v30, 
            TextProps = v16, 
            LinkMap = v31, 
            LayoutOrder = v29, 
            [v1.Tag] = "X-FitY"
        });
    end;
    v28.ToUAgreement = v32;
    v32 = false;
    if v21.Type == "Warn" then
        v32 = v1.createElement(v7, {
            LayoutOrder = v23:getNextOrder(), 
            Text = v22:getText("Agreement", "IAgree"), 
            Checked = v21.Checked, 
            OnChecked = function() --[[ Line: 143 ]] --[[ Name: OnChecked ]]
                -- upvalues: v21 (copy)
                v21.SetChecked(not v21.Checked);
            end, 
            [v1.Tag] = "X-FitY"
        });
    end;
    v28.AgreeCheckBox = v32;
    v24.DialogContainer = l_createElement_0(v26, v27, v28);
    return v24;
end;
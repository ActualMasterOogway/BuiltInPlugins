local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_Plugin_0 = v2.ContextServices.Plugin;
local l_Parent_0 = script.Parent;
local v6 = require(l_script_FirstAncestor_0.Src.Util.SocialPresence.SocialPresenceDmBridge);
local v7 = require(l_Parent_0.CollaboratorThumbnail);
local v8 = require(l_Parent_0.AddCollaboratorButton);
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddUsernameToRibbonAvatars)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v11) --[[ Line: 27 ]] --[[ Name: CollaboratorsRibbon ]]
    -- upvalues: l_Plugin_0 (copy), v1 (copy), v6 (copy), l_joinTags_0 (copy), v7 (copy), v9 (copy), v8 (copy)
    local v12 = l_Plugin_0:use():get();
    local v13, v14 = v1.useState(true);
    local v15, v16 = v1.useState({});
    local v17 = #v15 > 4;
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v6 (ref), v12 (copy), v14 (copy), v16 (copy)
        v6.requestAssetCollaborators(v12);
        local v19 = v6.connectOnDmChange(v12, function(v18) --[[ Line: 38 ]]
            -- upvalues: v14 (ref)
            v14(v18 == Enum.StudioDataModelType.Edit);
        end);
        local v21 = v6.connectOnUpdateCollaborators(v12, function(v20) --[[ Line: 41 ]]
            -- upvalues: v16 (ref)
            v16(v20);
        end);
        return function() --[[ Line: 44 ]]
            -- upvalues: v19 (copy), v21 (copy)
            v19:Disconnect();
            v21:Disconnect();
        end;
    end, {});
    if not v13 then
        return nil;
    else
        local v22 = {};
        for v23, v24 in v15 do
            if v23 <= 4 then
                v22[v24.UserId] = v1.createElement("Frame", {
                    [v1.Tag] = l_joinTags_0(v17 and "ThumbnailOverlap" or "X-Fit", "Role-Surface")
                }, {
                    CollaboratorThumbnail = v1.createElement(v7, {
                        UserId = v24.UserId, 
                        Username = if v9 then v24.Username else nil, 
                        IsIdle = v24.IsIdle, 
                        RingColor = v24.CollaboratorColor3, 
                        [v1.Tag] = "RibbonElement"
                    })
                });
            else
                break;
            end;
        end;
        if v17 then
            table.insert(v22, v1.createElement("Frame", {
                [v1.Tag] = "Component-OverflowBubble RibbonElement Role-Surface"
            }, {
                Text = v1.createElement("TextLabel", {
                    Text = ("+%*"):format(#v15 - 4), 
                    [v1.Tag] = "X-AnchorCenter Role-Surface X-Fit"
                })
            }));
        end;
        return v1.createElement("Frame", {
            LayoutOrder = v11.LayoutOrder, 
            [v1.Tag] = "Component-CollaboratorRibbon X-RowSpace100 X-Middle X-Fit Role-Surface"
        }, {
            CollaboratorContainer = if #v15 > 0 then v1.createElement("TextButton", {
                Text = "", 
                [v1.Event.Activated] = v11.OnClick, 
                [v1.Tag] = l_joinTags_0("X-Middle X-Fit Role-Surface", v17 and "X-Row" or "X-RowSpace50")
            }, v22) else nil, 
            CollaboratorButton = v1.createElement(v8, {
                IsTeamCreateOn = #v15 > 0
            })
        });
    end;
end;
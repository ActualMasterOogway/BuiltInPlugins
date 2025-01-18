local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v4 = require(l_Parent_0.Src.Util.DebugFlags);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local v6 = require(l_Parent_0.Src.API.Toolbox.getInventoryAssets);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 30 ]] --[[ Name: LoadToolboxFonts ]]
    -- upvalues: l_StudioService_0 (copy), v6 (copy), l_collectArray_0 (copy), v5 (copy), v4 (copy)
    return function(v9, v10) --[[ Line: 31 ]]
        -- upvalues: l_StudioService_0 (ref), v6 (ref), l_collectArray_0 (ref), v5 (ref), v4 (ref)
        local l_Networking_0 = v10.Networking;
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local function v13(v14) --[[ Line: 35 ]] --[[ Name: fetchAssets ]]
            -- upvalues: v6 (ref), l_Networking_0 (copy), l_l_StudioService_0_UserId_0 (copy), l_collectArray_0 (ref), v9 (copy), v5 (ref), v13 (copy), v4 (ref)
            v6(l_Networking_0, l_l_StudioService_0_UserId_0, Enum.AssetType.FontFamily):andThen(function(v15) --[[ Line: 37 ]]
                -- upvalues: l_collectArray_0 (ref), v9 (ref), v5 (ref), v13 (ref), v14 (copy)
                local v18 = l_collectArray_0(v15.responseBody.data, function(_, v17) --[[ Line: 38 ]]
                    return "rbxassetid://" .. v17.id;
                end);
                if #v18 == 0 then
                    return;
                else
                    v9:dispatch(v5(v18));
                    if v15.responseBody.nextPageCursor then
                        v13(v14);
                    end;
                    return;
                end;
            end):catch(function(v19) --[[ Line: 53 ]]
                -- upvalues: v4 (ref)
                if v4.LogNetworkErrors() then
                    warn("Failed to load inventory fonts, network error:", v19);
                    return;
                else
                    warn("Failed to load inventory fonts");
                    return;
                end;
            end);
        end;
        v13(nil);
    end;
end;
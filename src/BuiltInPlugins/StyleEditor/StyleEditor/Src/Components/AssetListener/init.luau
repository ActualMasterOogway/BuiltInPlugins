local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_useEffect_0 = require(l_Parent_0.Packages.React).useEffect;
local v4 = require(l_Parent_0.Src.Hooks.useDispatch);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadBuiltinFonts);
local v6 = require(l_Parent_0.Src.Thunks.Asset.LoadToolboxFonts);
local v7 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local _ = require(l_Parent_0.Src.Types);
return function() --[[ Line: 31 ]] --[[ Name: AssetListener ]]
    -- upvalues: v4 (copy), l_useEffect_0 (copy), v5 (copy), v6 (copy), l_MemStorageService_0 (copy), l_HttpService_0 (copy), v7 (copy)
    local v9 = v4();
    l_useEffect_0(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy), v5 (ref), v6 (ref), l_MemStorageService_0 (ref), l_HttpService_0 (ref), v7 (ref)
        v9(v5());
        v9(v6());
        local v13 = l_MemStorageService_0:Bind("AddToolboxAssetToInventory", function(v10) --[[ Line: 38 ]]
            -- upvalues: l_HttpService_0 (ref), v9 (ref), v7 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 39 ]]
                -- upvalues: l_HttpService_0 (ref), v10 (copy)
                return (l_HttpService_0:JSONDecode(v10));
            end);
            if not l_status_0 or not l_result_0 then
                return;
            elseif l_result_0.assetTypeId ~= Enum.AssetType.FontFamily.Value or not l_result_0.assetId then
                return;
            else
                v9(v7({
                    (tostring(l_result_0.assetId))
                }));
                return;
            end;
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v13 (copy)
            if v13 then
                v13:Disconnect();
            end;
        end;
    end, {});
    return nil;
end;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.PreviewModelGetter);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Parent_0.Core.Actions.SetPreviewModel);
local l_Packages_0 = l_Parent_0.Packages;
local l_getFFlagModelPreviewThumbnailFallback_0 = require(l_Packages_0.Framework).SharedFlags.getFFlagModelPreviewThumbnailFallback;
return function(v7, v8) --[[ Line: 13 ]]
    -- upvalues: l_getFFlagModelPreviewThumbnailFallback_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: l_getFFlagModelPreviewThumbnailFallback_0 (ref), v2 (ref), v7 (copy), v8 (copy), v4 (ref), v3 (ref)
        if l_getFFlagModelPreviewThumbnailFallback_0() then
            return v2(v7, v8):andThen(function(v10) --[[ Line: 16 ]]
                -- upvalues: v9 (copy), v4 (ref)
                v9:dispatch(v4(v10));
            end, function(v11) --[[ Line: 18 ]]
                -- upvalues: v3 (ref)
                if v3.shouldDebugWarnings() then
                    warn((tostring(v11)));
                end;
            end);
        else
            return v2(v7, v8):andThen(function(v12) --[[ Line: 25 ]]
                -- upvalues: v9 (copy), v4 (ref)
                v9:dispatch(v4(v12));
            end);
        end;
    end;
end;
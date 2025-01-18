local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local l_ToolboxSendPackageVersionNoteTelemetry_0 = game:GetFastFlag("ToolboxSendPackageVersionNoteTelemetry");
return function(v6, v7, v8, v9) --[[ Line: 8 ]]
    -- upvalues: l_ToolboxSendPackageVersionNoteTelemetry_0 (copy), v2 (copy), v4 (copy)
    return function(v10) --[[ Line: 9 ]]
        -- upvalues: l_ToolboxSendPackageVersionNoteTelemetry_0 (ref), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v2 (ref), v4 (ref)
        if l_ToolboxSendPackageVersionNoteTelemetry_0 then
            return v6:postVersionDescription(v7, v8, v9):andThen(function(_) --[[ Line: 11 ]]
                -- upvalues: v2 (ref), v7 (ref), v8 (ref), v9 (ref)
                v2.onPackageNoteCreated(v7, v8, v9);
            end, function(v12) --[[ Line: 13 ]]
                -- upvalues: v10 (copy), v4 (ref)
                v10:dispatch(v4(v12));
            end);
        else
            return v6:postVersionDescription(v7, v8, v9);
        end;
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Analytics);
local v2 = require(l_Parent_0.Src.Actions.SetCurrentStatus);
local v3 = require(l_Parent_0.Src.Actions.SetPageSaveState);
local v4 = require(l_Parent_0.Src.Util.CurrentStatus);
local v5 = require(l_Parent_0.Src.Util.SaveState);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function() --[[ Line: 17 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy), v5 (copy), l_Promise_0 (copy)
    return function(v7) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (ref), v3 (ref), v5 (ref), l_Promise_0 (ref)
        local v8 = tick();
        v1.onSaveAttempt();
        v7:dispatch(v2(v4.Working));
        local v9 = v7:getState();
        for v10, _ in pairs(v9.PageSaveState) do
            v7:dispatch(v3(v10, v5.Pending));
        end;
        for v12, v13 in pairs(v9.Settings.Changed) do
            v1.onSettingSaved(v12, v13);
        end;
        return l_Promise_0.new(function(v14, v15) --[[ Line: 32 ]]
            -- upvalues: v7 (copy), v5 (ref), v1 (ref), v3 (ref), v8 (copy), v2 (ref), v4 (ref)
            spawn(function() --[[ Line: 33 ]]
                -- upvalues: v7 (ref), v5 (ref), v1 (ref), v3 (ref), v8 (ref), v14 (copy), v2 (ref), v4 (ref), v15 (copy)
                local v16 = nil;
                local v17 = nil;
                while wait() do
                    v16 = true;
                    v17 = true;
                    for _, v19 in pairs(v7:getState().PageSaveState) do
                        if v19 == v5.SaveFailed then
                            v17 = false;
                        end;
                        if v19 == v5.Saving then
                            v16 = false;
                        end;
                    end;
                    if v16 then
                        break;
                    end;
                end;
                local v20 = v7:getState();
                for v21, v22 in pairs(v20.PageSaveState) do
                    if v22 == v5.SaveFailed then
                        v1.onPageSaveError(v21);
                    end;
                    v7:dispatch(v3(v21, v5.Unsaved));
                end;
                if v17 then
                    v1.onSaveSuccess(tick() - v8);
                    v14();
                    return;
                else
                    v1.onSaveError(tick() - v8);
                    v7:dispatch(v2(v4.Error));
                    v15({});
                    return;
                end;
            end);
        end);
    end;
end;
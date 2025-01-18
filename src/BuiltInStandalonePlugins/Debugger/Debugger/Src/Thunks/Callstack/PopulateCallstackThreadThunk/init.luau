local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.Callstack.CallstackRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Callstack.AddCallstack);
local v5 = require(l_Actions_0.Common.SetFilenameForGuid);
return function(v6, v7, v8, v9, v10) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy)
    return function(v11, _) --[[ Line: 9 ]]
        -- upvalues: v7 (copy), v6 (copy), v8 (copy), v2 (ref), v5 (ref), v9 (copy), v4 (ref), v10 (copy)
        v7:Populate(v6, function() --[[ Line: 10 ]]
            -- upvalues: v11 (copy), v8 (ref), v6 (ref), v2 (ref), v5 (ref), v9 (ref), v4 (ref), v10 (ref)
            if v11:getState().Common.debuggerConnectionIdToDST[v8.debuggerConnectionId] ~= v8 then
                return;
            else
                local l_v6_Children_0 = v6:GetChildren();
                local v14 = {};
                for v15, v16 in ipairs(l_v6_Children_0) do
                    local v17 = {};
                    if v15 == 1 then
                        v17 = {
                            Value = "", 
                            LeftIcon = v2.ICON_FRAME_TOP
                        };
                    end;
                    local v18 = {
                        arrowColumn = v17, 
                        frameColumn = v15, 
                        functionColumn = v16.FrameName, 
                        lineColumn = v16.Line < 0 and "" or v16.Line, 
                        sourceColumn = v16.Script
                    };
                    v11:dispatch(v5(v16.Script, ""));
                    v9:StartWatchingScriptLine(v16.Script, v11:getState().Common.currentDebuggerConnectionId, v16.Line);
                    table.insert(v14, v2.fromData(v18));
                end;
                if #v14 > 0 then
                    v11:dispatch(v4(v6.ThreadId, v14, v8));
                end;
                if v10 then
                    v10();
                end;
                return;
            end;
        end);
    end;
end;
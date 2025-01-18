local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("StreamingService");
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Cache.StreamCache);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixStreamCreationTiming);
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v4 (copy), v7 (copy), v3 (copy), v2 (copy), v6 (copy)
    local l_requestId_0 = v8.requestId;
    local l_arguments_0 = v8.arguments;
    local l_streamId_0 = l_arguments_0.text.streamId;
    if v1.RunningEval and not l_streamId_0 and type(l_arguments_0.text) == "string" then
        print((("<< DisplayText got collapsed stream >> \n%*\n<< /DisplayText >>"):format(l_arguments_0.text)));
        return;
    else
        local function v14(v12) --[[ Line: 25 ]] --[[ Name: handlePacket ]]
            -- upvalues: l_requestId_0 (copy), v4 (ref), l_streamId_0 (copy), v7 (ref), v3 (ref)
            if v12.isFinal then
                return;
            else
                local v13 = {
                    requestId = l_requestId_0, 
                    arguments = {
                        v12.command, 
                        v12.command == "DisplayContent" and "StreamText" or nil, 
                        v4.Dictionary.join({
                            requestId = l_requestId_0, 
                            streamId = l_streamId_0
                        }, v12)
                    }
                };
                if v7() then
                    v3:ExecuteCommandAsync(l_requestId_0, "QueueRichText", v13.arguments);
                    return;
                else
                    v3:InvokeCommand(l_requestId_0, "QueueRichText", v13.arguments);
                    return;
                end;
            end;
        end;
        local function v17(v15) --[[ Line: 51 ]] --[[ Name: activeStreamAcquired ]]
            -- upvalues: l_streamId_0 (copy), v2 (ref)
            local v16 = {
                requestId = v15, 
                streamId = l_streamId_0
            };
            v2:DisplayContent("MessageBubble", v16);
        end;
        local function v19() --[[ Line: 58 ]] --[[ Name: streamEnded ]]
            -- upvalues: l_requestId_0 (copy), l_streamId_0 (copy), v3 (ref)
            local v18 = {
                requestId = l_requestId_0, 
                arguments = {
                    "DisplayContent", 
                    "StreamEnded", 
                    {
                        requestId = l_requestId_0, 
                        streamId = l_streamId_0
                    }
                }
            };
            v3:InvokeCommand(l_requestId_0, "QueueRichText", v18.arguments);
        end;
        v6.requestStreamSubscription(l_requestId_0, l_streamId_0, true, v14, v17, v19);
        return;
    end;
end;
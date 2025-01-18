local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("ConversationalAIAcceptanceService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEndRequestWhenDisplayErrorMessage);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFIntConvAIMaxQuotaTimeout);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFIntConvAIServersAtMaxCapacityTimeout);
local function _(v9, v10) --[[ Line: 15 ]] --[[ Name: randomMessage ]]
    -- upvalues: v5 (copy)
    local v11 = math.random(1, #v9);
    return v5:getText("ErrorMessage", v9[v11], v10);
end;
local function _(v13, v14) --[[ Line: 20 ]] --[[ Name: streamText ]]
    -- upvalues: v2 (copy)
    v2:DisplayContent("StreamText", {
        requestId = v13, 
        content = v14
    });
end;
local function _(v16, v17, v18) --[[ Line: 27 ]] --[[ Name: setErrorMessage ]]
    -- upvalues: v2 (copy)
    v2:DisplayContent("SetErrorMessage", {
        message = v16, 
        disableInput = v17, 
        timeout = v18
    });
end;
local v57 = {
    function(v20, v21) --[[ Line: 35 ]] --[[ Name: handleRawErrorMessage ]]
        -- upvalues: v2 (copy)
        if v21.errorId == "RawErrorMessage" then
            local l_content_0 = v21.content;
            v2:DisplayContent("StreamText", {
                requestId = v20, 
                content = l_content_0
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v24) --[[ Line: 43 ]] --[[ Name: handleRawErrorStatusBar ]]
        -- upvalues: v2 (copy)
        if v24.errorId == "RawErrorStatusBar" then
            v2:DisplayContent("SetStatusBarMessage", {
                message = v24.content or "", 
                disableInput = v24.disableInput or false, 
                timeout = v24.timeout or 0
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v25, v26) --[[ Line: 55 ]] --[[ Name: handleInappropriateRequest ]]
        -- upvalues: v5 (copy), v2 (copy)
        if v26.errorId == "InappropriateRequest" then
            local v27 = string.format("<br/><a href=\"%s\">%s</a>", "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards", "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards");
            local v28 = {
                "InappropriateRequestOne1", 
                "InappropriateRequestTwo1"
            };
            local v29 = {
                url = v27
            };
            local v30 = math.random(1, #v28);
            local v31 = v5:getText("ErrorMessage", v28[v30], v29);
            v2:DisplayContent("StreamText", {
                requestId = v25, 
                content = v31
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v33) --[[ Line: 71 ]] --[[ Name: handleQuotaError ]]
        -- upvalues: v5 (copy), v7 (copy), v2 (copy)
        if v33.errorId == "QuotaError" then
            local v34 = {
                "QuotaErrorOne", 
                "QuotaErrorTwo", 
                "QuotaErrorThree"
            };
            local v35 = math.random(1, #v34);
            local v36 = v5:getText("ErrorMessage", v34[v35], nil);
            v34 = v7();
            v2:DisplayContent("SetErrorMessage", {
                message = v36, 
                disableInput = true, 
                timeout = v34
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v37, v38) --[[ Line: 85 ]] --[[ Name: handleConnectionLost ]]
        -- upvalues: v5 (copy), v2 (copy)
        if v38.errorId == "ConnectionLost" then
            local v39 = {
                "ConnectionLostOne", 
                "ConnectionLostTwo"
            };
            local v40 = math.random(1, #v39);
            local v41 = v5:getText("ErrorMessage", v39[v40], nil);
            v2:DisplayContent("StreamText", {
                requestId = v37, 
                content = v41
            });
            return true;
        else
            return false;
        end;
    end, 
    function(_, v43) --[[ Line: 97 ]] --[[ Name: handleServersAtMaxCapacity ]]
        -- upvalues: v5 (copy), v8 (copy), v2 (copy)
        if v43.errorId == "ServersAtMaxCapacity" then
            local v44 = {
                "ServersAtMaxCapacity"
            };
            local v45 = math.random(1, #v44);
            local v46 = v5:getText("ErrorMessage", v44[v45], nil);
            v44 = v8();
            v2:DisplayContent("SetErrorMessage", {
                message = v46, 
                disableInput = true, 
                timeout = v44
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v47, v48) --[[ Line: 109 ]] --[[ Name: handleGeneralError ]]
        -- upvalues: v5 (copy), v2 (copy)
        if v48.errorId == "GeneralError" then
            local v49 = {
                "GeneralError"
            };
            local v50 = math.random(1, #v49);
            local v51 = v5:getText("ErrorMessage", v49[v50], nil);
            v2:DisplayContent("StreamText", {
                requestId = v47, 
                content = v51
            });
            return true;
        else
            return false;
        end;
    end, 
    function(v52, v53) --[[ Line: 120 ]] --[[ Name: handleStreamingServiceError ]]
        -- upvalues: v5 (copy), v2 (copy)
        if v53.errorId == "StreamingServiceError" then
            if v53.errorType == "HttpFailed" and tonumber(v53.errorMessage) ~= 200 then
                local v54 = {
                    "ConnectionLostOne", 
                    "ConnectionLostTwo"
                };
                local v55 = math.random(1, #v54);
                local v56 = v5:getText("ErrorMessage", v54[v55], nil);
                v2:DisplayContent("StreamText", {
                    requestId = v52, 
                    content = v56
                });
            end;
            return true;
        else
            return false;
        end;
    end
};
return function(v58) --[[ Line: 148 ]] --[[ Name: errorMessageHandler ]]
    -- upvalues: v57 (copy), v3 (copy), v6 (copy), v2 (copy)
    local l_arguments_0 = v58.arguments;
    for _, v61 in ipairs(v57) do
        if v61(v58.requestId or "", l_arguments_0) then
            v3:ErrorTelemetry(v58.requestId or "", l_arguments_0.errorId or "UnknownError", l_arguments_0.errorType or "", l_arguments_0.errorMessage or "");
            break;
        end;
    end;
    if v6() then
        v2:DisplayContent("EndRequest", {
            requestId = v58.requestId
        });
    end;
end;
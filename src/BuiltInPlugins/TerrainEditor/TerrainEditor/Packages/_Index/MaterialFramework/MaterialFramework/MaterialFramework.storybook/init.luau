local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_DocParser_0 = require(l_Parent_1.Framework).Util.Typecheck.DocParser;
local v3 = require(l_Parent_0.Middleware.StoryMiddleware);
return {
    name = "Material Framework", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0
    }, 
    mapStory = v3, 
    mapDefinition = function(v4) --[[ Line: 23 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_DocParser_0 (copy)
        local v5 = l_DocParser_0.new(v4.name, v4.source.Parent);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
            -- upvalues: v5 (copy)
            return v5:parse();
        end);
        if l_status_0 then
            v4.docs = l_result_0;
            v4.summary = l_result_0.Summary;
        end;
        return v4;
    end
};
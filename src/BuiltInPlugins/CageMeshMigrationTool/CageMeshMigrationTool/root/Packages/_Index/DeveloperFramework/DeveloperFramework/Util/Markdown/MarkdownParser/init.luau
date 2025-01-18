local buildTree = require(script.Parent.BuildTree)
local postProcessTree = require(script.Parent.PostProcessTree)
local tokenize = require(script.Parent.Tokenize)

local Types = require(script.Parent.Types)
type Node = Types.Node

local Parser = {}

function Parser.safeParse(input: string)
	local ok, result = xpcall(function()
		return Parser.parse(input)
	end, function(err)
		return `{err}\n{debug.traceback()}`
	end)
	return ok, result
end

function Parser.parse(input: string): Node
	local tokens = tokenize(input)
	local root = buildTree(tokens)
	root.children = postProcessTree(root)
	return root
end

return Parser

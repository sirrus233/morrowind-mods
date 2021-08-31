local sdk = {}

local socket = require("socket")
local bit = require("bit")

local rest = require("Chromawind.ChromaSDK.rest")
sdk.rest = rest

local instance = require("Chromawind.ChromaSDK.instance")

function sdk.get()
	return rest.send({
		method = "GET",
		url = "http://localhost:54235/razer/chromasdk",
	})
end

--- Initializes Chroma SDK.
---
--- Dev Portal: https://assets.razerzone.com/dev_portal/REST/html/md__r_e_s_t_external_01_8init.html
--- @param params table
--- @return ChromaSDKInstance
function sdk.new(params)
	local response = rest.send({
		method = "POST",
		url = "http://localhost:54235/razer/chromasdk",
		data = {
			title = params.title,
			description = params.description,
			author =params.author,
			device_supported = params.device_supported,
			category = params.category,
		},
	})

	if (not response or response.result == 0 or not response.uri) then
		error(string.format("Could not initialize Chroma SDK. Response: %s", json.encode(response or {}, { indent = true })))
	end

    return setmetatable({ session = response.sessionid, url = response.uri }, instance)
end

function sdk.sleep(seconds)
	socket.sleep(seconds)
end

function sdk.color(r, g, b)
	return r * 255 + bit.lshift(g * 255, 8) + bit.lshift(b * 255, 16)
end

return sdk
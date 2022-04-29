
description "vrp_blackpay"

dependency "vrp"

client_scripts{ 
	"@vrp/client/Proxy.lua",
	"@vrp/client/Tunnel.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
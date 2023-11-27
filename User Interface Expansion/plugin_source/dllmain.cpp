
#include "stdafx.h"

extern "C" {
#include <lua.h>
#include <lauxlib.h>
}

#include "PatchWorldMap.h"

static const struct luaL_Reg functions[] = {
	{ "centreOnPlayer", UIEXT::centreOnPlayer },
	{ "getMapData", UIEXT::getMapData },
	{ "hookMapOverrides", UIEXT::patchWorldMap },
	{ "onInitialized", UIEXT::onInitialized },
	{ "onLoaded", UIEXT::onLoaded },
	{ "setMapZoom", UIEXT::setMapZoom },
	{ NULL, NULL }
};

extern "C" int __declspec(dllexport) luaopen_uiexp_map_extension(lua_State* L) {
	luaL_register(L, "uiexp_map_extension", functions);
	return 1;
}

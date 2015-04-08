import ceylon.json { parseJson = parse, JsonObject = Object }

"Run the module `client`."
shared void run() {
    dynamic {
        dynamic socket = WebSocket("ws://localhost:9999/websocket");
        dynamic target = jQuery("#target");
        socket.onmessage = void (dynamic event) {
            assert(is JsonObject json = parseJson(event.data));
            assert(is String name = json["name"],
                   is String version = json["version"],
                   is Integer downloads = json["downloads"]);
            dynamic item = jQuery("<div/>");
            dynamic badge = jQuery("<span/>").attr("class", "badge").text(downloads);
            item.attr("class", "module");
            item.append(badge).append(" ``name``/``version``");
            item.hide();
            target.append(item);
            item.fadeIn();
        };
    }

}


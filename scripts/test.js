var LOG_LEVEL = "info";

var PROPERTIES = [
    "audio-speed-correction",
    "video-speed-correction",
    "display-sync-active",
    "filename",
    "file-format",
    "decoder-frame-drop-count",
    "frame-drop-count",
    "mistimed-frame-count",
    "vsync-ratio",
    "vo-delayed-frame-count",
    "metadata",
    "video-frame-info",
    "container-fps",
    "estimated-vf-fps",
    "display-fps",
    "estimated-display-fps",
    "vsync-jitter",
    "display-width",
    "display-height",
    "display-hidpi-scale",
    "af",
    "vf",
    "vo-passes",
    "perf-info",
    "current-vo",
    "current-ao",
    "mpv-configuration",
    "mpv-configuration",
    "libass-version",
    "platform",
];

function logEverything() {
    var i = 0;
    for (i = 0; i < PROPERTIES.length; i++) {
        var tabs = Array(Math.floor(PROPERTIES[i].length / 8)).join("\t");
        var s =
            ":" +
            tabs +
            mp.get_property_native(PROPERTIES[i]) +
            "\t\t" +
            mp.get_property(PROPERTIES[i]);
        mp.msg.log(LOG_LEVEL, PROPERTIES[i], s);
    }
}

mp.add_key_binding("l", "log-everything", logEverything);

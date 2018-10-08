:local blacklistURL "http://192.168.1.100/z_blacklist.rsc"

:local updateOk true
:local importOk true

:do {
    /log info "Blacklist: fetching update..."
    /tool fetch url="$blacklistURL" output=file dst-path="z_blacklist.rsc"
} on-error={
    /log error "Blacklist: fetching update failed."
    :set updateOk false
    :set importOk false
}

:if ($updateOk) do={
    :do {
        /log info "Blacklist: importing new blacklist..."
        /import file-name="z_blacklist.rsc"
    } on-error={
        /log error "Blacklist: importing new blacklist failed."
        :set importOk false
    }
}

:if ($importOk) do={
    /log info "Blacklist: importing finished."
}

Function AddVPNRoute([Parameter(Mandatory=$True)][string]$ip) {
    $vpnInterface = route print MSFTVPN | Select-String "(\d+)\.*MSFTVPN" | ForEach-Object{$_.Matches.Groups[1].Value}
    Write-Host "Adding route for ip $($ip) to MSFTVPN interface $($vpnInterface)"
    route add $ip MASK 255.255.255.255 0.0.0.0 IF $vpnInterface
}
